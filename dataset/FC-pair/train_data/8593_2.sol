contract c8593{
  /**
  * @dev transfer token for a specified address
      * @param _to The address to transfer to.
          * @param _value The amount to be transferred.
              */
  function transfer(address _to, uint256 _value) public returns (bool) {
    if( preICO_address[msg.sender] ) require( now > endDate + 120 days ); //Lock coin
    else require( now > endDate ); //Lock coin
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    Transfer(msg.sender, _to, _value);
    return true;
  }
}