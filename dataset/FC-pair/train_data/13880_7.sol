contract c13880{
  /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender].amount);
    // SafeMath.sub will throw if there is not enough balance.
    balances[msg.sender].amount = balances[msg.sender].amount.sub(_value);
    balances[_to].amount = balances[_to].amount.add(_value);
    if(!isExist(_to) && _to != owner){
      balances[_to].exist = true;
      addressList.push(_to);
    }
    emit Transfer(msg.sender, _to, _value);
    return true;
  }
}