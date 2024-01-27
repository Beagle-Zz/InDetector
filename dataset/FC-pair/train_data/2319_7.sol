contract c2319{
  /**
   * @dev Transfer tokens from one address to another
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint the amount of tokens to be transferred
   */
  function transferFrom(address _from, address _to, uint _value) external returns (bool) {
    uint _allowed = allowed[_from][msg.sender];
    require(_value <= _allowed);
    allowed[_from][msg.sender] = _allowed.sub(_value);
    return transfer_(_from, _to, _value);
  }
}