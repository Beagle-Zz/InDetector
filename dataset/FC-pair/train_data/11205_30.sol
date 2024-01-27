contract c11205{
 /**
   * @dev Reverts if beneficiary is not whitelisted. Can be used when extending this contract.
   */
  modifier isWhitelisted(address _beneficiary) {
    require(whitelist[_beneficiary].stage==Stage.PROCESS3_SUCCESS);
    _;
  }
}