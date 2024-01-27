contract c16883{
  /**
   * @dev Throws if called by any account other than the authorized one.
   * @param authorized the address of the authorized caller.
   */
  modifier onlyBy(address authorized) {
    require(authorized != address(0));
    require(msg.sender == authorized);
    _;
  }
}