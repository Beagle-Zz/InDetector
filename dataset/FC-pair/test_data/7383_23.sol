contract c7383{
  /**
   * @dev claim a admin role from an address
   * @param _role the name of the role
   */
  function claimAdmin(string _role)
    public
    onlyOwner
  {
    removeRoleAll(_role);
    addRole(msg.sender, _role);
  }
}