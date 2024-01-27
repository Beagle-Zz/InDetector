contract c2090{
  /**
   * @dev modifier to scope access to manager
   * // reverts
   */
  modifier onlyMANAGER() {
    checkRole(msg.sender, ROLE_MANAGER);
    _;
  }
}