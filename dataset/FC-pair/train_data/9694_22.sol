contract c9694{
  // -----------------------------------------
  // Private PreSale internal
  // -----------------------------------------
   /**
   * @dev low level token purchase ***DO NOT OVERRIDE***
   * @param _beneficiary Address performing the token purchase
   */
  function buyTokens(address _beneficiary) internal whenNotPaused {
    uint256 weiAmount = msg.value;
    // calculate token amount to be created
    uint256 tokenAmount = getTokenAmount(weiAmount);
    // Validation Checks
    preValidateChecks(_beneficiary, weiAmount, tokenAmount);
    // update state
    tokensIssued = tokensIssued.add(tokenAmount);
    weiRaised = weiRaised.add(weiAmount);
    // Send tokens from token wallet
    TOKEN.transferFrom(TOKEN_WALLET, _beneficiary, tokenAmount);
    // Forward the funds to wallet
    FUNDS_WALLET.transfer(msg.value);
    // Event trigger
    emit TokenPurchase(msg.sender, _beneficiary, weiAmount, tokenAmount);
  }
}