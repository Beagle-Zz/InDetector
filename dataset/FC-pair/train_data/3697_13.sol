contract c3697{
  /**
   * @dev modifier to scope access to admins
   * // reverts if called not by admin
   */
  modifier onlyAdmin()
  {
    checkRole(msg.sender, ROLE_ADMIN);
    _;
  }
}