contract c7383{
  /**
   * @dev remove a role from an address
   * @param _role the name of the role
   */
  function removeRoleAll(string _role)
    internal
  {
    delete roles[_role];
    emit RoleRemovedAll(_role);
  }
}