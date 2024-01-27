contract c10226{
  /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balanceOf(msg.sender));
    // SafeMath.sub will throw if there is not enough balance.
    // Use the contract storage
    setBalanceOf(msg.sender, balanceOf(msg.sender).sub(_value));
    setBalanceOf(_to, balanceOf(_to).add(_value));
    emit Transfer(msg.sender, _to, _value);
    return true;
  }
}