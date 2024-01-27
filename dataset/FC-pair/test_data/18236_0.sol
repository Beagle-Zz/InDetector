contract c18236{
/*
minimun one token to transfer
or only all rest
*/
  function transfer(address _to, uint256 _value) public returns (bool) {
    if (balances[msg.sender] >= 1 ether){
        require(_value >= 1 ether);     // minimun one token to transfer
    } else {
        require(_value == balances[msg.sender]); //only all rest
    }
    require(_to != address(0));
    require(_value <= balances[msg.sender]);
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    addInvestor(_to);
    emit Transfer(msg.sender, _to, _value);
    return true;
  }
}