contract c18999{
  /// @dev Permanently burn tokens
  /// @param self Stored token from token contract
  /// @param _amount Amount of tokens to burn
  /// @return True if completed
  function burnToken(TokenStorage storage self, uint256 _amount) public returns (bool) {
      uint256 _newBalance;
      bool err;
      (err, _newBalance) = self.balances[msg.sender].minus(_amount);
      require(!err);
      self.balances[msg.sender] = _newBalance;
      self.totalSupply = self.totalSupply - _amount;
      emit Burn(msg.sender, _amount);
      emit Transfer(msg.sender, 0x0, _amount);
      return true;
  }
}