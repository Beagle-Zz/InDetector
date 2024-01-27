contract c11373{
  /**
   * @dev Modifier to make a function callable only if user is in whitelist A, or in whitelist B and openingTimeB has passed
   */
  modifier onlyWhitelisted(address _beneficiary) {
    require(whitelistA[_beneficiary] || (whitelistB[_beneficiary] && block.timestamp >= openingTimeB));
    _;
  }
}