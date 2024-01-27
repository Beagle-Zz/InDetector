contract c10674{
  /**
   * @dev Modifier throws if called by any account other than the pendingGDPOracle.
   */
  modifier onlyPendingGDPOracle() {
    require(msg.sender == pendingGDPOracle_);
    _;
  }
}