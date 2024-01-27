contract c224{
  /**
   * @notice Add an address to an existing id 
   * @param _newAddress Address to add to account
   * @param _sender User requesting this action
   */
  function addAddressToAccount(
    address _newAddress,
    address _sender
    ) external onlyAccountRegistryLogic nonZero(_newAddress) {
    // check if address belongs to someone else
    require(!addressBelongsToAccount(_newAddress));
    accountByAddress[_newAddress] = accountIdForAddress(_sender);
  }
}