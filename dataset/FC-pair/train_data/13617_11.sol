contract c13617{
  /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  /*@CTK transfer_success
    @pre _to != address(0)
    @pre balances[msg.sender] >= _value
    @pre __reverted == false
    @post __reverted == false
    @post __return == true
   */
  /*@CTK transfer_same_address
    @tag no_overflow
    @pre _to == msg.sender
    @post this == __post
   */
  /*@CTK transfer_conditions
    @tag assume_completion
    @pre _to != msg.sender
    @post __post.balances[_to] == balances[_to] + _value
    @post __post.balances[msg.sender] == balances[msg.sender] - _value
   */
  /* CertiK Smart Labelling, for more details visit: https://certik.org */
  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender]);
    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    emit Transfer(msg.sender, _to, _value);
    return true;
  }
}