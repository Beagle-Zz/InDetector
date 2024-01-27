contract c13479{
  /**
   * @notice Change the address which is authorized to send bought tokens with BTC
   * @param _address Address of the authorized btc tokens bought client
   */
  function setBtcTokenBoughtAddress(address _address) external {
    require(contractManager.authorize(contractName, msg.sender));
    require(_address != address(0));
    require(_address != btcTokenBoughtAddress);
    address oldAddress = btcTokenBoughtAddress;
    btcTokenBoughtAddress = _address;
    emit BtcTokenBoughtAddressChanged(oldAddress, _address);
  }
}