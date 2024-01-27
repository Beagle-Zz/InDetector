contract c12424{
    /** @dev Function for getting the current block.
      * @return _blockNumber
      */
    function getblock() public view returns (uint256 _blockNumber){
        return block.number;
    }
}