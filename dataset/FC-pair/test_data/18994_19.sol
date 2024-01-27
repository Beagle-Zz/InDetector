contract c18994{
  /// @dev Authorize an account to send tokens on caller's behalf
  /// @param self Stored token from token contract
  /// @param _spender Address to authorize
  /// @param _value Number of tokens authorized account may send
  /// @return True if completed
  function approve(TokenStorage storage self, address _spender, uint256 _value) public returns (bool) {
    // must set to zero before changing approval amount in accordance with spec
    require((_value == 0) || (self.allowed[msg.sender][_spender] == 0));
    self.allowed[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }
}