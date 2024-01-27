contract c7469{
  /**
   * @dev Gets the store managing the specified app
   * @param _appNickname The nickname of the app
   */
  function getStore(
    string _appNickname
  )
  public
  constant returns (address)
  {
    ManagerInterface theManager = ManagerInterface(manager);
    return theManager.getStoreAddress(_appNickname);
  }
}