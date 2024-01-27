contract c8606{
  /**
   * @dev Burns a specific amount of tokens.
   * @param _value The amount of token to be burned.
   */
  function burn(uint256 _value) public returns (bool) {
    _burn(msg.sender, _value);
    return true;
  }
}