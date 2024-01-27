contract c13950{
  /**
   * @dev After the reservation is paid, transfers tokens from the contract to the
   * specified address (which must have deposited ethers earlier).
   * @param _beneficiary Address that will receive the tokens.
   */
  function claimTokens(address _beneficiary) public whenPaid {
    require(_beneficiary != address(0));
    uint256 depositAmount = deposits[_beneficiary];
    if (depositAmount != 0) {
      uint256 tokens = tokensReceived.mul(depositAmount).div(weiCollected);
      assert(tokens != 0);
      deposits[_beneficiary] = 0;
      getToken().transfer(_beneficiary, tokens);
    }
  }
}