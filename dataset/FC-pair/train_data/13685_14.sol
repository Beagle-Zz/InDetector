contract c13685{
  // admin only can transfer from the privileged accounts
  function transferFromPrivileged(address _from, address _to, uint _value) public onlyOwner onlyNotSame(_from, _to) returns (bool success) {
    uint availablePrevilegedBalance = previligedBalances[_from];
    balances[_from] = safeSub(balances[_from], _value);
    balances[_to] = safeAdd(balances[_to], _value);
    previligedBalances[_from] = safeSub(availablePrevilegedBalance, _value);
    Transfer(_from, _to, _value);
    return true;
  }
}