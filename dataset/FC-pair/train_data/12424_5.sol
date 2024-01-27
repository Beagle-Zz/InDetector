contract c12424{
    /** @dev Function which calculates the revenue of given block.
      * @param _blockNumber The block for which the revenue will be calculated.
      * @param winner The winner bet (1 - odd or 2 - even).
      * @param loser The loser bet (2 even or 1 - odd).
      * The function is called by the calculateRevenueAtBlock()
      */
    function calculateRevenue(uint256 _blockNumber, uint256 winner, uint256 loser) internal {
        uint256 revenue = oddAndEvenBets[_blockNumber][loser];
        if (oddAndEvenBets[_blockNumber][ODD] != 0 && oddAndEvenBets[_blockNumber][EVEN] != 0) {
            uint256 comission = (revenue.div(100)).mul(COMMISSION_PERCENTAGE);
            revenue = revenue.sub(comission);
            comissionsAtBlock[_blockNumber] = comission;
            IMoneyManager(moneyManager).payTo(ownerWallet, comission);
            uint256 winners = oddAndEvenBets[_blockNumber][winner].div(BET);
            blockRevenuePerTicket[_blockNumber] = revenue.div(winners);
        }
        isBlockRevenueCalculated[_blockNumber] = true;
        emit LogRevenue(_blockNumber, winner, revenue);
    }
}