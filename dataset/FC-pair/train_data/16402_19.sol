contract c16402{
  //function that is called when a user or another contract wants to transfer funds
  function transfer(address _to, uint _value, bytes _data) public returns (bool success) {
    //filtering if the target is a contract with bytecode inside it
    if (!super.transfer(_to, _value)) revert(); // do a normal token transfer
    if (isContract(_to)) contractFallback(msg.sender, _to, _value, _data);
    emit Transfer(msg.sender, _to, _value, _data);
    return true;
  }
}