contract c13478{
  /**
   * @notice Change whether an address is authorized to use a specific contract or not
   * @param _contractName Name of the contract to which the accessor will gain authorization or not
   * @param _authorizedAddress Address which will have its authorisation status changed
   * @param _authorized Boolean whether the address will have access or not
   */
  function setAuthorizedContract(string _contractName, address _authorizedAddress, bool _authorized) external onlyContractOwner("ContractManager", msg.sender) {
    bytes memory contractNameBytes = bytes(_contractName);
    require(contractNameBytes.length != 0);
    require(_authorizedAddress != address(0));
    require(authorization[_contractName][_authorizedAddress] != _authorized);
    authorization[_contractName][_authorizedAddress] = _authorized;
    emit AuthorizationChanged(_authorizedAddress, _authorized, _contractName);
  }
}