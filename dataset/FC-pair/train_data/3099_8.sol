contract c3099{
  // Multiple Transactions
  function transferMulti(address[] _to, uint256[] _value) public returns (bool success) {
    require (_value.length==_to.length);
    for(uint256 i = 0; i < _to.length; i++) {
        require (balances[msg.sender] >= _value[i]);
        require (_to[i] != 0x0);
        super.transfer(_to[i], _value[i]);
    }
        return true;
  }
}