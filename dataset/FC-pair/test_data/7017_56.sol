contract c7017{
  /**
   * @dev Assures that the provided address is a valid destination to transfer tokens to.
   * @param _to Target address.
   */
  modifier validDestination(
    address _to
  )
  {
    require(_to != address(0x0));
    require(_to != address(this));
    require(_to != address(crowdsaleAddress));
    _;
  }
}