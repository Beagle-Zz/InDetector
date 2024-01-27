contract c2319{
  /**
  * @dev transfer token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  */
  function transfer(address _to, uint _value) external returns (bool) {
    return transfer_(msg.sender, _to, _value);
  }
}