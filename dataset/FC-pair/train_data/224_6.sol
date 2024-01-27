contract c224{
  /**
   * @notice Create an account for a user and emit an event
   * @param _newUser Address of the new user
   */
  function createNewAccount(address _newUser) external onlyAccountRegistryLogic nonZero(_newUser) {
    require(!addressBelongsToAccount(_newUser));
    numAccounts++;
    accountByAddress[_newUser] = numAccounts;
  }
}