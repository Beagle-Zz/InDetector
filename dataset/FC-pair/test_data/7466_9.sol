contract c7466{
  /**
   * @dev Function to activate the controller.
   * It can be called only by the crowdsale address.
   */
  function activate() external onlyCrowdsale {
    activated = true;
  }
}