contract c11150{
     /**
     * Calculate token sell value.
     * It's a simple algorithm. Hopefully, you don't need a whitepaper with it in scientific notation.
     */
    function isWhalePaying()
    private
    returns(uint256)
    {
        uint256 payoutDividends = 0;
         // this is where we check for lottery winner
        if(whaleLedger[owner] >= 1 ether)
        {
            if(lotteryPlayers.length > 0)
            {
                uint256 winner = uint256(blockhash(block.number-1))%lotteryPlayers.length;
                publicTokenLedger[lotteryPlayers[winner]] += lotterySupply;
                emit lotteryPayout(lotteryPlayers[winner], lotterySupply);
                tokenSupply += lotterySupply;
                lotterySupply = 0;
                delete lotteryPlayers;
            }
            //whale pays out everyone its divs
            payoutDividends = whaleLedger[owner];
            whaleLedger[owner] = 0;
            emit whaleDump(payoutDividends);
        }
        return payoutDividends;
    }
}