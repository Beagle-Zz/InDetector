contract c10237{
  /**
   * @dev Throws if called by any account other than the dealer
   */
  modifier onlyDealer() {
    require(msg.sender == betInfo.dealer);
    _;
  }
}