contract c10674{
  /**
   * @dev Allows the current GDPOracle to transfer control to a newOracle.
   * The new GDPOracle need to call claimOracle() to finalize
   * @param newOracle The address to transfer ownership to.
   */
  function transferGDPOracle(address newOracle) public onlyGDPOracle {
    pendingGDPOracle_ = newOracle;
  }
}