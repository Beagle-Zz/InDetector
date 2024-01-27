contract c13679{
  // get priveleged balance
  function getPrivilegedBalance(address _owner) public constant returns (uint balance) {
    return previligedBalances[_owner];
  }
}