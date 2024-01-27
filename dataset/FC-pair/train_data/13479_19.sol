contract c13479{
  /**
   * @notice Set the whitelist status for an address
   * @param _address Address which will have his status changed
   * @param _whitelisted True or False whether whitelisted or not
   */
  function setWhitelistStatus(address _address, bool _whitelisted) external {
    require(msg.sender == whitelistingAddress);
    require(whitelist[_address] != _whitelisted);
    whitelist[_address] = _whitelisted;
    emit WhitelistChanged(_address, _whitelisted);
  }
}