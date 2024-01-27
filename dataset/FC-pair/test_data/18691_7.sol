contract c18691{
  /**
   * Whitelist manegement
   */
  function setKycWhitelist(address _address, bool _state) public onlyManagement {
    isKycWhitelist[_address] = _state;
    KycWhitelisted(_address, _state);
  }
}