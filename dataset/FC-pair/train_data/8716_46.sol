contract c8716{
  /**
   * @dev Sets mint authorised address.
   * @param _target Address for which we want to check if it is authorized.
   * @return Is authorized or not.
   */
  function isAuthorizedAddress(
    address _target
  )
    external
    view
    returns (bool)
  {
    require(_target != address(0));
    return addressToAuthorized[_target];
  }
}