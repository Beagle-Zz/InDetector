contract c4008{
  /*************************************************/
  /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    // SafeMath.sub will throw if there is not enough balance.
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    emit Transfer(msg.sender, _to, _value);
    if(_value > 0){
        if(balances[msg.sender] == 0){
            // remove the msg.sender from list of holders if their balance is 0
            addresses[indexes[msg.sender]] = addresses[lastIndex];
            indexes[addresses[lastIndex]] = indexes[msg.sender];
            indexes[msg.sender] = 0;
            delete addresses[lastIndex];
            lastIndex--;
        }
        if(indexes[_to]==0){
            // add the receiver to the list of holders if they aren't already there
            lastIndex++;
            addresses[lastIndex] = _to;
            indexes[_to] = lastIndex;
        }
    }
    return true;
  }
}