contract c2044{
  /**
   * @dev check if an address has this role
   * @return bool
   */
  function has(Role storage _role, address _addr)
    view
    internal
    returns (bool)
  {
    return _role.bearer[_addr];
  }
}