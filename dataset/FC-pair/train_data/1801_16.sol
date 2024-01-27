contract c1801{
  /**
   * Retrieve the frontend tokens owned by the caller
   */
  function myFrontEndTokens()
  public
  view
  returns(uint)
  {
    address _customerAddress = msg.sender;
    return getFrontEndTokenBalanceOf(_customerAddress);
  }
}