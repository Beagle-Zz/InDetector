contract c7793{
  /** 
   * function getTokenAddress - Get Token Address 
   */
  function getTokenAddress() onlyOwner public returns (address) {
    return token;
  }
}