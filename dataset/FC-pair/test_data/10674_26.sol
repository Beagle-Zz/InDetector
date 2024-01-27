contract c10674{
  /**
   * @dev Modifier Throws if called by any account other than the GDPOracle.
   */
  modifier onlyGDPOracle() {
    require(msg.sender == GDPOracle_);
    _;
  }
}