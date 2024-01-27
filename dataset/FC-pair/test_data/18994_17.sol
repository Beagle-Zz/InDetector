contract c18994{
  /// @dev Authorized caller transfers tokens from one account to another
  /// @param self Stored token from token contract
  /// @param _from Address to send tokens from
  /// @param _to Address to send tokens to
  /// @param _value Number of tokens to send
  /// @return True if completed
  function transferFrom(TokenStorage storage self,
                        address _from,
                        address _to,
                        uint256 _value)
                        public
                        returns (bool)
  {
    uint256 _allowance = self.allowed[_from][msg.sender];
    bool err;
    uint256 balanceOwner;
    uint256 balanceSpender;
    (err,balanceOwner) = self.balances[_from].minus(_value);
    require(!err);
    (err,balanceSpender) = _allowance.minus(_value);
    require(!err);
    self.balances[_from] = balanceOwner;
    self.allowed[_from][msg.sender] = balanceSpender;
    self.balances[_to] = self.balances[_to] + _value;
    emit Transfer(_from, _to, _value);
    return true;
  }
}