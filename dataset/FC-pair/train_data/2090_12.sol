contract c2090{
  /**
   * @dev modifier to scope access to cro
   * // reverts
   */
  modifier onlyCRO() {
    checkRole(msg.sender, ROLE_CRO);
    _;
  }
}