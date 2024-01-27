contract c10127{
  /**
   * @dev register the address for token sale
   * @param _addr address The address to register for token sale
   */
  function register(address _addr)
    public
    onlyAdmin
  {
    require(_addr != address(0));
    registeredAddress[_addr] = true;
    emit Registered(_addr);
  }
}