contract c11316{
  /**
   * @dev Checks modifier and allows transfer if tokens are not locked.
   * @param _to The address that will recieve the tokens.
   * @param _value The amount of tokens to be transferred.
   */
  function transfer(address _to, uint _value) public canTransfer(msg.sender, _value) {
    super.transfer(_to, _value);
  }
}