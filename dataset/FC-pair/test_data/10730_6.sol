contract c10730{
  //No approve needed, only from msg.sender
  function withdrawTokens(address token, uint256 tokens) public {
    balances[token][msg.sender] = balances[token][msg.sender].sub(tokens);
    depositedTokens[token] = depositedTokens[token].sub(tokens);
    ERC20Interface(token).transfer(msg.sender, tokens);
    Withdraw(token, msg.sender, tokens, balances[token][msg.sender]);
  }
}