contract c7383{
  /**
   * @dev Throws if called by any account that's not a Admin.
   */
  modifier onlyAdmin(string _role) {
    checkRole(msg.sender, _role);
    _;
  }
}