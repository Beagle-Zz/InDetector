contract c3341{
  /// @dev Withdraws the tokens
  function withdrawTokens() public {
    uint256 amount = balances[msg.sender];
    require(amount > 0, "You have no tokens left");
    balances[msg.sender] = 0;
    require(tokenContract.transfer(msg.sender, amount), "Token transfer failed");
  }
}