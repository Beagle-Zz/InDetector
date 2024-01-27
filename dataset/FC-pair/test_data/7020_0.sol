contract c7020{
  /**
   * register and change authorized user
   */
  function setAuthorizedUser(address addr, bool state) onlyAuthorized public {
    AuthorizedUser[addr] = state;
    emit AuthorizedUserChanged(addr, state);
  }
}