contract c13478{
  /**
   * @notice Check whether the accessor is authorized to access that contract
   * @param _contractName Name of the contract that is being accessed
   * @param _accessor Address who wants to access that contract
   */
  function authorize(string _contractName, address _accessor) external onlyContractOwner(_contractName, _accessor) view returns (bool) {
    return true;
  }
}