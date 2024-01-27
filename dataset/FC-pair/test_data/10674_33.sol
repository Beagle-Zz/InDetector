contract c10674{
  /**
  * @dev get GDPOracle
  * @return the address of the GDPOracle
  */
  function pendingGDPOracle() public view returns (address) { // solium-disable-line mixedcase
    return pendingGDPOracle_;
  }
}