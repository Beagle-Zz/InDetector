contract c16624{
  // Users can withdraw any amount of a given token up to their current balance.
  function withdrawToken(address token, uint256 amount) external {
    require(userBalance[msg.sender][token] >= amount);
    userBalance[msg.sender][token] = userBalance[msg.sender][token].sub(amount);
    require(Token(token).transfer(msg.sender, amount));
    emit Withdrawal(msg.sender, token, amount);
    emit UserBalanceUpdated(msg.sender, token, userBalance[msg.sender][token]);
  }
}