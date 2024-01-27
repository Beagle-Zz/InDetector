contract c1152{
  /**
   * Retrieves your currently selected dividend rate.
   */
  function getMyDividendRate()
  public
  view
  returns(uint8)
  {
    address _customerAddress = msg.sender;
    require(userSelectedRate[_customerAddress]);
    return userDividendRate[_customerAddress];
  }
}