contract c13488{
  /**
   * A token purchase with anti-money laundering
   *
   * ©return tokenAmount How many tokens where bought
   */
  function buyWithKYCData(bytes dataframe, uint8 v, bytes32 r, bytes32 s) public payable returns(uint tokenAmount) {
    uint _tokenAmount;
    uint multiplier = 10 ** 18;
    // Perform signature check for normal addresses
    // (not deployment accounts, etc.)
    if(earlyParticipantWhitelist[msg.sender]) {
      // Deployment provided early participant list is for deployment and diagnostics
      // For test purchases use this faux customer id 0x1000
      _tokenAmount = investInternal(msg.sender, 0x1000);
    } else {
      // User comes through the server, check that the signature to ensure ther server
      // side KYC has passed for this customer id and whitelisted Ethereum address
      bytes32 hash = sha256(dataframe);
      var (whitelistedAddress, customerId, minETH, maxETH, pricingInfo) = getKYCPayload(dataframe);
      // Check that the KYC data is signed by our server
      require(ecrecover(hash, v, r, s) == signerAddress);
      // Only whitelisted address can participate the transaction
      require(whitelistedAddress == msg.sender);
      // Server gives us information what is the buy price for this user
      uint256 tokensTotal = calculateTokens(msg.value, pricingInfo);
      _tokenAmount = buyTokens(msg.sender, customerId, tokensTotal);
    }
    if(!earlyParticipantWhitelist[msg.sender]) {
      // We assume there is no serious min and max fluctuations for the customer, unless
      // especially set in the server side per customer manual override.
      // Otherwise the customer can reuse old data payload with different min or max value
      // to work around the per customer cap.
      require(investedAmountOf[msg.sender] >= minETH * multiplier / 10000);
      require(investedAmountOf[msg.sender] <= maxETH * multiplier / 10000);
    }
    return _tokenAmount;
  }
}