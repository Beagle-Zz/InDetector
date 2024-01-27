contract c3828{
   //Remember you need pre-approval for this - nice with ApproveAndCall
  function depositTokens(address from, address token, uint256 tokens ) public returns (bool success)
  {
      //we already have approval so lets do a transferFrom - transfer the tokens into this contract
      if(!ERC20Interface(token).transferFrom(from, this, tokens)) revert();
      balances[token][from] = balances[token][from].add(tokens);
      depositedTokens[token] = depositedTokens[token].add(tokens);
      Deposit(token, from, tokens, balances[token][from]);
      return true;
  }
}