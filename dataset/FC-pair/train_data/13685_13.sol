contract c13685{
  // get priveleged balance
  function getPrivilegedBalance(address _owner) public constant returns (uint balance) {
    return previligedBalances[_owner];
  }
}