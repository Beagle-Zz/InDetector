contract c12455{
    /// @notice use token address ETH_TOKEN_ADDRESS for ether
    /// @dev best conversion rate for a pair of tokens, if number of reserves have small differences. randomize
    /// @param src Src token
    /// @param dest Destination token
    /* solhint-disable code-complexity */
    function findBestRate(ERC20 src, ERC20 dest, uint srcQty) public view returns(uint, uint) {
        uint bestRate = 0;
        uint bestReserve = 0;
        uint numRelevantReserves = 0;
        uint numReserves = reserves.length;
        uint[] memory rates = new uint[](numReserves);
        uint[] memory reserveCandidates = new uint[](numReserves);
        for (uint i = 0; i < numReserves; i++) {
            //list all reserves that have this token.
            if (!(perReserveListedPairs[reserves[i]])[keccak256(src, dest)]) continue;
            rates[i] = reserves[i].getConversionRate(src, dest, srcQty, block.number);
            if (rates[i] > bestRate) {
                //best rate is highest rate
                bestRate = rates[i];
            }
        }
        if (bestRate > 0) {
            uint random = 0;
            uint smallestRelevantRate = (bestRate * 10000) / (10000 + negligibleRateDiff);
            for (i = 0; i < numReserves; i++) {
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
        return (bestReserve, bestRate);
    }
}