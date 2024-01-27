contract c2090{
  /**
   * @dev modifier to scope access to reviewer
   * // reverts
   */
  modifier onlyREVIEWER() {
    checkRole(msg.sender, ROLE_REVIEWER);
    _;
  }
}