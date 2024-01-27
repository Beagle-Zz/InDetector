contract c12424{
    /** @dev Function which will return the block commission.
      * @param _blockNumber The block for which we will get the commission.
      * @return _comission
      */
    function getBlockComission(uint256 _blockNumber) public view returns (uint256 _comission) {
        return comissionsAtBlock[_blockNumber];
    }
}