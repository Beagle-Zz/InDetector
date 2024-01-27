contract c8495{
  /**
   * Allow given spender to transfer given number of tokens from message sender.
   * @param _spender address to allow the owner of to transfer tokens from message sender
   * @param _value number of tokens to allow to transfer
   * @return true if token transfer was successfully approved, false otherwise
   */
   function approve (address _spender, uint256 _value) returns (bool success) {
    allowances [msg.sender][_spender] = _value;
    emit Approval (msg.sender, _spender, _value);
    return true;
  }
}