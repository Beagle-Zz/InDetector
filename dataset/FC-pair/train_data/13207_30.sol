contract c13207{
  /**
  * @dev check if pre sale or main sale are running
  */
  function isPublicTokenSaleRunning() public view returns (bool) {
    return (isPreSaleRunning() || isMainSaleRunning());
  }
}