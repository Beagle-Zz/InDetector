contract c12091{
  /**
   * @dev Transfer token for a specified address when not paused
   * @param _to The address to transfer to.
   * @param _value The amount to be transferred.
   */
  function transfer(address _to, uint256 _value) whenNotPaused returns (bool) {
    require(_to != address(0));
    return super.transfer(_to, _value);
  }
}