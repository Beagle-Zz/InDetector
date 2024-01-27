contract c3701{
  /**
   * @dev Add admin role to an address
   * @param addr address
   */
  function addAdmin(address addr)
    public
    onlyAdmin
  {
    addRole(addr, ROLE_ADMIN);
  }
}