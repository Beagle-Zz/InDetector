contract c8310{
  /**
   * @dev Get invested amount for given investor address
   * @param _investor Investors address
   */
  function getInvestedAmount(address _investor) public view returns (uint256) { // return the invested amount
    return investors[_investor];
  }
}