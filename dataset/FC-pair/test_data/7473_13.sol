contract c7473{
  // primary methods
  /**
   * @dev Allow a wallet to claim ownership of an account
   * @param _appNickname Identifies the web app for the account
   * @param _postId Id id of the post contains the signature
   * @param _gasPrice The gas price for Oraclize
   * @param _gasLimit The gas limit for Oraclize
   */
  function claimAccountOwnership(
    string _appNickname,
    string _postId,
    uint _gasPrice,
    uint _gasLimit
  )
  public
  whenAppSet(_appNickname)
  payable
  {
    require(bytes(_postId).length > 0);
    require(msg.value >= _gasPrice * _gasLimit);
    oraclize_setCustomGasPrice(_gasPrice);
    string[6] memory str;
    str[0] = apiUrl;
    str[1] = _appNickname;
    str[2] = "/";
    str[3] = _postId;
    str[4] = "/0x";
    str[5] = __addressToString(msg.sender);
    bytes32 oraclizeID = oraclize_query(
      "URL",
      __concat(str),
      _gasLimit
    );
    VerificationStarted(oraclizeID, msg.sender, _appNickname, _postId);
    __tempData[oraclizeID] = TempData(msg.sender, manager.getAppId(_appNickname));
  }
}