contract c12424{
    /** @dev Function which calculates the revenue for block.
      * @param _blockNumber The block for which the revenie will be calculated.
      */
    function calculateRevenueAtBlock(uint256 _blockNumber) public afterBlock(_blockNumber) {
        require(isBlockRevenueCalculated[_blockNumber] == false);
        if(oddAndEvenBets[_blockNumber][ODD] > 0 || oddAndEvenBets[_blockNumber][EVEN] > 0) {
            blockResult[_blockNumber] = getBlockHashOddOrEven(_blockNumber);
            require(blockResult[_blockNumber] == ODD || blockResult[_blockNumber] == EVEN);
            if (blockResult[_blockNumber] == ODD) {
                calculateRevenue(_blockNumber, ODD, EVEN);
            } else if (blockResult[_blockNumber] == EVEN) {
                calculateRevenue(_blockNumber, EVEN, ODD);
            }
        } else {
            isBlockRevenueCalculated[_blockNumber] = true;
            blockResult[_blockNumber] = noBets;
        }
    }
}