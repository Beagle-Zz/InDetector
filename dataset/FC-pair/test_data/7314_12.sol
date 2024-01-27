contract c7314{
    /* solhint-disable code-complexity */
    // Not sure how solhing defines complexity. Anyway, from our point of view, below code follows the required
    //  algorithm to choose a reserve, it has been tested, reviewed and found to be clear enough.
    //@dev this function always src or dest are ether. can't do token to token
    function searchBestRate(ERC20 src, ERC20 dest, uint srcAmount) public view returns(address, uint) {
        uint bestRate = 0;
        uint bestReserve = 0;
        uint numRelevantReserves = 0;
        //return 1 for ether to ether
        if (src == dest) return (reserves[bestReserve], PRECISION);
        address[] memory reserveArr;
        if (src == ETH_TOKEN_ADDRESS) {
            reserveArr = reservesPerTokenDest[dest];
        } else {
            reserveArr = reservesPerTokenSrc[src];
        }
        if (reserveArr.length == 0) return (reserves[bestReserve], bestRate);
        uint[] memory rates = new uint[](reserveArr.length);
        uint[] memory reserveCandidates = new uint[](reserveArr.length);
        for (uint i = 0; i < reserveArr.length; i++) {
            //list all reserves that have this token.
            rates[i] = (KyberReserveInterface(reserveArr[i])).getConversionRate(src, dest, srcAmount, block.number);
            if (rates[i] > bestRate) {
                //best rate is highest rate
                bestRate = rates[i];
            }
        }
        if (bestRate > 0) {
            uint random = 0;
            uint smallestRelevantRate = (bestRate * 10000) / (10000 + negligibleRateDiff);
            for (i = 0; i < reserveArr.length; i++) {
                if (rates[i] >= smallestRelevantRate) {
                    reserveCandidates[numRelevantReserves++] = i;
                }
            }
            if (numRelevantReserves > 1) {
                //when encountering small rate diff from bestRate. draw from relevant reserves
                random = uint(block.blockhash(block.number-1)) % numRelevantReserves;
            }
            bestReserve = reserveCandidates[random];
            bestRate = rates[bestReserve];
        }
        return (reserveArr[bestReserve], bestRate);
    }
}