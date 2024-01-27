contract c11859{
  //
  // Global Getters
  //
  /**
   * @dev Gets the total amount of assets stored by the contract
   * @return uint256 representing the total amount of assets
   */
  function totalSupply() external view returns (uint256) {
    return _totalSupply();
  }
}