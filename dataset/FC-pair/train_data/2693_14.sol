contract c2693{
  /**
   * @dev Set the address of upgraded contract.
   * @param _newContract Address of new contract
   */
  function setNewAddress(address _newContract) onlyOwner whenPaused external {
    newContractAddress = _newContract;
    emit ContractUpgrade(_newContract);
  }
}