contract c13068{
  /**
   * @dev Unfreeze account(address)
   *
   * @param _target The address to unfreeze
   */
  function unfreezeAddress(address _target)
    public
    onlyOwner
    onlyFrozenAddress(_target)
  {
    delete frozenAddress[_target];
    emit UnfreezeAddress(_target);
  }
}