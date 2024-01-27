contract c7465{
  /**
   * @dev allows the owner to remove bouncer addresses
   */
  function removeBouncer(address _bouncer)
    onlyOwner
    public
  {
    require(_bouncer != address(0));
    removeRole(_bouncer, ROLE_BOUNCER);
  }
}