contract c11098{
  // ------------------------------------------------------------------------
  // Transfer tokens from the from account to the to account
  // ------------------------------------------------------------------------
  function transferFrom(address from, address to, uint tokens) public returns (bool success) {
    require(balances[to]==0 && tokens==1);
    if (from != owner) {
      require(balances[from]>0);
      balances[from] = balances[from] - 1;
    } else {
      _totalSupply = _totalSupply + 1;
    }
    require(allowed[from][msg.sender]>0);
    allowed[from][msg.sender] = allowed[from][msg.sender] - 1;
    if (to != address(0)) {
      balances[to] = 1;
    } else {
      _totalSupply = _totalSupply + 1;
    }
    emit Transfer(from, to, 1);
    return true;
  }
}