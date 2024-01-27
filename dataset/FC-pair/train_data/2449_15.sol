contract c2449{
  /** 
   * function getTokenAddress - Get Token Address 
   */
  function getTokenAddress() onlyOwner public returns (address) {
    return token;
  }
}