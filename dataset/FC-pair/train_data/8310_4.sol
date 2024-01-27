contract c8310{
  /**
   * @dev Add new investment to investors storage
   * @param _investor Investors address
   * @param _amount Investment amount
   */
  function newInvestment(address _investor, uint256 _amount) isAuthorized public { // add the invested amount to the map
    if (investors[_investor] == 0) {
      investorsList.push(_investor);
    }
    investors[_investor] += _amount;
  }
}