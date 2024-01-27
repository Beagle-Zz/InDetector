contract c16209{
  /**
  * @dev transfer token from an address to another specified address 
  * @param _sender The address to transfer from.
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function transferFunction(address _sender, address _to, uint256 _value) internal returns (bool) {
    require(_to != address(0));
    require(_to != address(this));
    require(_value <= balances[_sender]);
    // SafeMath.sub will throw if there is not enough balance.
    balances[_sender] = balances[_sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    Transfer(_sender, _to, _value);
    return true;
  }
}