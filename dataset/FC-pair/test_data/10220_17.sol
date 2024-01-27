contract c10220{
  /**
   * Declines transfers from/to frozen addresses.
   */
  function transfer(address _to, uint256 _value) whenNotPaused returns (bool) {
    require(!isFrozen(msg.sender));
    require(!isFrozen(_to));
    return super.transfer(_to, _value);
  }
}