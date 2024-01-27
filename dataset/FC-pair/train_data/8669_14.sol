contract c8669{
    /**
     * @dev Returns whether the target address is a contract
     * @param _addr address to check
     * @return whether the target address is a contract
     */
    function isContract(address _addr) internal view returns (bool) {
      uint256 size;
      assembly { size := extcodesize(_addr) }
      return size > codeSize ;
    }
}