contract c3701{
  /**
   * @dev Revoke oracle role from an address
   * @param addr address
   */
  function delOracle(address addr)
    public
    onlyAdmin
  {
    removeRole(addr, ROLE_ORACLE);
  }
}