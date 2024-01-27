contract c11008{
  /**
   * @dev retrieves price for action
   * @param action Name of action, e.g. 'create_insurance_contract'
   */
  function getActionPrice(string action) public view returns (uint) {
    return actionPrices[action];
  }
}