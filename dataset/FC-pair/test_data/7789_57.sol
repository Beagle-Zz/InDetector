contract c7789{
  /**
   * @dev Assures that tokens can be transfered.
   */
  modifier onlyWhenTransferAllowed()
  {
    require(transferEnabled || msg.sender == crowdsaleAddress);
    _;
  }
}