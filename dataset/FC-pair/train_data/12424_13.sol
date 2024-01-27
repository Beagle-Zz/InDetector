contract c12424{
    /** @dev Function for getting the given block hash
      * @param _blockNumber The block number of which you want to check hash.
      * @return _blockHash
      */
    function getBlockHash(uint256 _blockNumber) public view returns (bytes32 _blockHash) {
        return blockHash[_blockNumber];
    }
}