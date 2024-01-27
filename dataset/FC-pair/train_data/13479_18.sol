contract c13479{
  /**
   * @notice Change the address that is authorized to change whitelist
   * @param _address The authorized address
   */
  function setWhitelistingAddress(address _address) external {
    require(contractManager.authorize(contractName, msg.sender));
    require(_address != address(0));
    require(_address != whitelistingAddress);
    address oldAddress = whitelistingAddress;
    whitelistingAddress = _address;
    emit WhitelistingAddressChanged(oldAddress, _address);
  }
}