contract c16883{
  /**
   * @dev Reverts if beneficiary is not whitelisted and isFreeTransferAllowed is false. Can be used when extending this contract.
   * @param _beneficiary the address which must be whitelisted by the KYC process in order to pass unless isFreeTransferAllowed.
   */
  modifier isWhitelistedOrFreeTransferAllowed(address _beneficiary) {
    require(isFreeTransferAllowed || whitelist[_beneficiary]);
    _;
  }
}