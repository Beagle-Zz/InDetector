contract c13478{
  /**
   * @dev Throws when sender does not match contract name
   * @param _contractName Name of the contract the sender is checked against
   */
  modifier onlyRegisteredContract(string _contractName) {
    require(contracts[_contractName] == msg.sender);
    _;
  }
}