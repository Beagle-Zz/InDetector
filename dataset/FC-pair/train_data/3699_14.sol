contract c3699{
  /**
   * @dev modifier to scope access of backend keys stored on
   * investor's portal
   * // reverts if called not by backend
   */
  modifier onlyBackend()
  {
    checkRole(msg.sender, ROLE_BACKEND);
    _;
  }
}