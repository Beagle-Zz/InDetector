contract c16787{
  /**
   * @dev Reverts if beneficiary is not whitelisted. Can be used when extending this contract.
   * @param _beneficiary the address which must be whitelisted by the KYC process in order to pass.
   */
  modifier isWhitelisted(address _beneficiary) {
    require(whitelist[_beneficiary]);
    _;
  }
}