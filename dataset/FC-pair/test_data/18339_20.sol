contract c18339{
  /**
   * Transfer allowance from other address's allowance
   *
   * Send `_value` tokens to `_to` in behalf of `_from`
   *
   * @param _from The address of the sender
   * @param _to The address of the recipient
   * @param _value the amount to send
   */
  function transferAllowance(address _from, address _to, uint256 _value) public returns (bool success) {
    updatePlayerRewards(_from);
    require(_value <= allowed[_from][msg.sender]);     // Check allowance
    allowed[_from][msg.sender] -= _value;
    if (_transfer(_from, _to, _value)) {
      // allow msg.sender to spend _to's tokens
      allowed[_to][msg.sender] += _value;
      emit Approval(_to, msg.sender, _value);
      return true;
    }
    return false;
  }
}