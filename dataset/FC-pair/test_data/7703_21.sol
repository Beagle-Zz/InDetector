contract c7703{
  // owner can mint tokens during crowdsale withing defined caps
  function mintTokens(address beneficiary, uint256 tokens) external onlyOwner returns (bool) {
    require(beneficiary != 0x0);
    require(tokens != 0);
    token.mint(beneficiary, tokens);
    emit TokenPurchase(msg.sender, beneficiary, tokens);
  }
}