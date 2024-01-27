contract c12424{
    /** @dev Function for getting the wei amount for given block.
      * @param _blockNumber The block for which you want to get wei amount.
      * @param _blockOddOrEven The block which is odd or even.
      * @return _weiAmountAtStage
      */
    function getoddAndEvenBets(uint256 _blockNumber, uint256 _blockOddOrEven) public view returns (uint256 _weiAmountAtStage) {
        return oddAndEvenBets[_blockNumber][_blockOddOrEven];
    }
}