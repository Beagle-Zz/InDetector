contract c10123{
    /* Dividend Handling */
    // These are all handled based on their corresponding index
    // Takes a snapshot of the current dividend pool balance and allocates a per share div award
    function setDividendWinners(
        uint[] _playerContractIds, 
        uint[] _totalPlayerTokens, 
        uint8[] _individualPlayerAllocationPcs, 
        uint _totalPrizePoolAllocationPc
    ) 
        external 
        onlyOwnerOrReferee 
    {
        require(_playerContractIds.length > 0, "Must have valid player contracts to award divs to");
        require(_playerContractIds.length == _totalPlayerTokens.length);
        require(_totalPlayerTokens.length == _individualPlayerAllocationPcs.length);
        require(_totalPrizePoolAllocationPc > 0);
        require(_totalPrizePoolAllocationPc <= 100);
        // Calculate how much dividends we have allocated
        uint dailyDivPrizePool = SafeMath.div(SafeMath.mul(getTotalDividendPool(), _totalPrizePoolAllocationPc), 100);
        // Iteration here should be fine as there should concievably only ever be 3 or 4 winning players each day
        uint8 totalPlayerAllocationPc = 0;
        for (uint8 i = 0; i < _playerContractIds.length; i++) {
            totalPlayerAllocationPc += _individualPlayerAllocationPcs[i];
            // Calculate from the total daily pool how much is assigned to owners of this player
            // e.g. a typical day might = Total Dividend pool: 100 ETH, _totalPrizePoolAllocationPc: 20 (%)
            // therefore the total dailyDivPrizePool = 20 ETH
            // Which could be allocated as follows
            // 1. 50% MVP Player - (Attacker) (10 ETH total)
            // 2. 25% Player - (Midfielder) (5 ETH total)
            // 3. 25% Player - (Defender) (5 ETH total)
            uint playerPrizePool = SafeMath.div(SafeMath.mul(dailyDivPrizePool, _individualPlayerAllocationPcs[i]), 100);
            // Calculate total div-per-share
            uint totalPlayerTokens = _totalPlayerTokens[i];
            uint perTokenEthValue = playerPrizePool.div(totalPlayerTokens);
            // Add to the winners array so it can then be picked up by the div payment processor
            DividendWinner memory divWinner = DividendWinner({
                playerTokenContractId: _playerContractIds[i],
                perTokenEthValue: perTokenEthValue,
                totalTokens: totalPlayerTokens,
                tokensProcessed: 0
            });
            dividendWinners_.push(divWinner);
        }
        // We need to make sure we are allocating a valid set of dividend totals (i.e. not more than 100%)
        // this is just to cover us for basic errors, this should never occur
        require(totalPlayerAllocationPc == 100);
    }
}