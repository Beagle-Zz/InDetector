contract c13843{
  // returns krown balance of given address 	
  function balanceOf(address _owner) constant returns (uint balance) {
    return balances[_owner];
  }
}