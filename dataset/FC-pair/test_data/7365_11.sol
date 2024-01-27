contract c7365{
  /**
   * @dev Check if the given address is non-user
   * @param _addr address to check
   */   
  function isContract(address _addr) private returns (bool is_contract) {
      uint length;
      assembly {
            //retrieve the size of the code on target address, this needs assembly
            length := extcodesize(_addr)
      }
      return (length>0);
  }
}