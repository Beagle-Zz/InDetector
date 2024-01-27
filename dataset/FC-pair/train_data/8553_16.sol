contract c8553{
  /* single address */
  function sendTokensToInvestors(address _investor, uint _tokens) onlyOwner returns (bool ok){
      require(balances[contractAddress] >= _tokens);
      onSaleTokens = safeSub(onSaleTokens, _tokens);
      balances[contractAddress] = safeSub(balances[contractAddress],_tokens);
      balances[_investor] = safeAdd(balances[_investor],_tokens);
      return true;
  }
}