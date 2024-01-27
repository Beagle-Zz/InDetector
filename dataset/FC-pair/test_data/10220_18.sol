contract c10220{
  /**
   * Declines transfers from/to/by frozen addresses.
   */
  function transferFrom(address _from, address _to, uint256 _value) whenNotPaused returns (bool) {
    require(!isFrozen(msg.sender));
    require(!isFrozen(_from));
    require(!isFrozen(_to));
    return super.transferFrom(_from, _to, _value);
  }
}