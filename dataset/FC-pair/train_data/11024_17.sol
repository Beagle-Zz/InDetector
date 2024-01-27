contract c11024{
  /**
  * @dev disable whitelist state
  *
  */
  function disableWhitelist() public onlyOwner returns (bool whitelistState) {
    whitelistEnable = false;
    emit WhitelistState(msg.sender, whitelistEnable);
    return whitelistEnable;
  }
}