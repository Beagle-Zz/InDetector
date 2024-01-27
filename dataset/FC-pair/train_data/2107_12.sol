contract c2107{
  /*
   * @notice `proxyPayment()` allows the caller to send ether to the Campaign and
     have the tokens created in an address of their choosing
   * @param _owner The address that will hold the newly created tokens
   */
  function proxyPayment(address _owner) public payable returns(bool) {
      doPayment(_owner);
      return true;
  }
}