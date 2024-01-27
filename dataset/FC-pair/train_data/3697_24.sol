contract c3697{
  /**
   * @dev Revoke backend privileges from an address
   * @param addr address
   */
  function delBackend(address addr)
    public
    onlyAdmin
  {
    removeRole(addr, ROLE_BACKEND);
  }
}