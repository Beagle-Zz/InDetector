contract c13068{
  /**
   * @dev Freeze account(address)
   *
   * @param _target The address to freeze
   */
  function freezeAddress(address _target)
    public
    onlyOwner
    onlyNotFrozenAddress(_target)
  {
    frozenAddress[_target] = true;
    emit FreezeAddress(_target);
  }
}