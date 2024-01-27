contract c3699{
  /**
   * @dev Revoke admin privileges from an address
   * @param addr address
   */
  function delAdmin(address addr)
    public
    onlyAdmin
  {
    removeRole(addr, ROLE_ADMIN);
  }
}