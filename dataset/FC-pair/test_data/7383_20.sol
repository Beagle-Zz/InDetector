contract c7383{
  /**
   * @dev getter to determine if address has Admin role
   */
  function isAdmin(address _addr, string _role)
    public
    view
    returns (bool)
  {
    return hasRole(_addr, _role);
  }
}