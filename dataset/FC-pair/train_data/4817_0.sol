contract c4817{
  /**
   * @notice Associate a string, which represents an EOS address, to the Ethereum address of the entity interacting with the contract
   * @param eosAddress A string value that represents an EOS address
   */
  function registerEOSAddress(string eosAddress) public {
    assert(bytes(eosAddress).length <= 64);
    eosAddressBook[msg.sender] = eosAddress;
    emit LogRegisterEOSAddress(msg.sender, eosAddress);
  }
}