contract c1801{
  /**
   * Retrieve the dividend tokens owned by the caller
   */
  function myDividendTokens()
  public
  view
  returns(uint)
  {
    address _customerAddress = msg.sender;
    return getDividendTokenBalanceOf(_customerAddress);
  }
}