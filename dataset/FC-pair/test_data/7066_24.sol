contract c7066{
  /**
   * Set fee collector.
   *
   * @param _newFeeCollector address of the new fee collector
   */
  function setFeeCollector (address _newFeeCollector)
  public delegatable payable {
    require (msg.sender == owner);
    feeCollector = _newFeeCollector;
  }
}