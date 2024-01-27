contract c7383{
  /**
   * @dev remove a admin role from an address
   * @param _operator address
   * @param _role the name of the role
   */
  function removeAdmin(address _operator, string _role)
    public
    onlyOwner
  {
    removeRole(_operator, _role);
  }
}