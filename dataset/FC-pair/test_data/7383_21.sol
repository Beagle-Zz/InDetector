contract c7383{
  /**
   * @dev add a admin role to an address
   * @param _operator address
   * @param _role the name of the role
   */
  function addAdmin(address _operator, string _role)
    public
    onlyOwner
  {
    addRole(_operator, _role);
  }
}