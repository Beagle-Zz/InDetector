contract c12424{
    /** @dev Function for getting the block result if it is ODD or EVEN.
      * @param _blockNumber The block for which you want to get the result.
      * @return _oddOrEven
      */
    function getBlockResult(uint256 _blockNumber) public view returns (uint256 _oddOrEven){
        return blockResult[_blockNumber];
    }
}