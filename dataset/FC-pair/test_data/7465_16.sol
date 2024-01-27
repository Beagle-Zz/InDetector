contract c7465{
  /**
   * @dev allows the owner to add additional bouncer addresses
   */
  function addBouncer(address _bouncer)
    onlyOwner
    public
  {
    require(_bouncer != address(0));
    addRole(_bouncer, ROLE_BOUNCER);
  }
}