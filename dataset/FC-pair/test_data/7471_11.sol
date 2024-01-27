contract c7471{
  /**
   * @dev Sets a wallet as customer service to perform emergency removal of wrong, abused, squatted tweedentities (due, for example, to hacking of the Twitter account)
   * @param _address The customer service wallet
   * @param _status The status (true is set, false is unset)
   */
  function setCustomerService(
    address _address,
    bool _status
  )
  public
  onlyOwner
  {
    require(_address != address(0));
    customerService[_address] = _status;
    bool found;
    for (uint i = 0; i < __customerServiceAddress.length; i++) {
      if (__customerServiceAddress[i] == _address) {
        found = true;
        break;
      }
    }
    if (!found) {
      __customerServiceAddress.push(_address);
    }
    CustomerServiceSet(_address);
  }
}