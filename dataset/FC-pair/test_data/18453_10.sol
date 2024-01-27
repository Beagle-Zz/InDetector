contract c18453{
  // Owner may burn own tokens
  function burnTokens(uint256 amount) onlyOwner external {
    balances[owner] = balances[owner].sub(amount);
  }
}