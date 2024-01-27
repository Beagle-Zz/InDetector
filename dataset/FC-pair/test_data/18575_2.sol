contract c18575{
  /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function transfer(address _to, uint256 _value) public returns (bool) {
    if (msg.sender != owner && msg.sender != addressTeam){  
      require(!frozenAccountICO); 
    }
    require(!frozenAccount[_to]);   // Check if recipient is frozen  
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    emit Transfer(msg.sender, _to, _value);
    return true;
  }
}