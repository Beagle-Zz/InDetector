contract c10127{
  /**
   * @dev register the addresses for token sale
   * @param _addrs address[] The addresses to register for token sale
   */
  function registerByList(address[] _addrs)
    public
    onlyAdmin
  {
    for(uint256 i = 0; i < _addrs.length; i++) {
      require(_addrs[i] != address(0));
      registeredAddress[_addrs[i]] = true;
      emit Registered(_addrs[i]);
    }
  }
}