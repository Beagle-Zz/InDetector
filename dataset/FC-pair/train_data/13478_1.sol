contract c13478{
  /**
   * @dev Throws when sender is not owner of contract manager
   * @param _contractName Name of the contract to check the _accessor against
   * @param _accessor Address that wants to access this specific contract
   */
  modifier onlyContractOwner(string _contractName, address _accessor) {
    require(contracts[_contractName] == msg.sender || contracts[_contractName] == address(this));
    require(_accessor != address(0));
    require(authorization[_contractName][_accessor] == true);
    _;
  }
}