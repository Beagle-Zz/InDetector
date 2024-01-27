contract c7475{
  /**
  * @dev Sets the app
  * @param _appNickname Nickname (e.g. twitter)
  * @param _appId ID (e.g. 1)
  */
  function setApp(
    string _appNickname,
    uint _appId,
    address _checker
  )
  external
  onlyOwner
  {
    require(!appSet);
    require(_appId > 0);
    require(_checker != address(0));
    require(bytes(_appNickname).length > 0);
    appId = _appId;
    appNickname = _appNickname;
    checker = UidCheckerInterface(_checker);
    appSet = true;
    AppSet(_appNickname, _appId, _checker);
  }
}