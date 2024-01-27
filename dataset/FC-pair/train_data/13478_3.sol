contract c13478{
  /**
   * @notice Add a new contract to the manager
   * @param _contractName Name of the new contract
   * @param _address Address of the new contract
   */
  function addContract(string _contractName, address _address) external  onlyContractOwner("ContractManager", msg.sender) {
    bytes memory contractNameBytes = bytes(_contractName);
    require(contractNameBytes.length != 0);
    require(contracts[_contractName] == address(0));
    require(_address != address(0));
    contracts[_contractName] = _address;
    emit ContractAdded(_address, _contractName);
  }
}