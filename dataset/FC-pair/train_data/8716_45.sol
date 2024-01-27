contract c8716{
  /**
   * @dev Sets authorised address for minting.
   * @param _target Address to set authorized state.
   * @param _authorized True if the _target is authorised, false to revoke authorization.
   */
  function setAuthorizedAddress(
    address _target,
    bool _authorized
  )
    onlyOwner
    external
  {
    require(_target != address(0));
    addressToAuthorized[_target] = _authorized;
    emit AuthorizedAddress(_target, _authorized);
  }
}