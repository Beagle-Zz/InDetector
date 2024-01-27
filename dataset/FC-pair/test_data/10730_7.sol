contract c10730{
  //Requires approval so it can be public
  function withdrawTokensFrom( address from, address to,address token,  uint tokens) public returns (bool success) {
      balances[token][from] = balances[token][from].sub(tokens);
      depositedTokens[token] = depositedTokens[token].sub(tokens);
      allowed[token][from][to] = allowed[token][from][to].sub(tokens);
      ERC20Interface(token).transfer(to, tokens);
      Withdraw(token, from, tokens, balances[token][from]);
      return true;
  }
}