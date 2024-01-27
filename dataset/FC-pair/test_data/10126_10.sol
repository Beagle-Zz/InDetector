contract c10126{
  // ------------------------------------------------------------------------
  // Burns a specific amount of tokens.
  // ------------------------------------------------------------------------
  function burn(uint256 _value) public {
    _burn(msg.sender, _value);
  }
}