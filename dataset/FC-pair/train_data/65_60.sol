contract c65{
  /*
  Approves a spender to spend an amount of your tokens on your behalf
  @param _spender: The address allowed to spend your tokens
  @param _amount: The number of tokens that will be approved
  */
  function approve(address _spender, uint _amount) external view {
    // Begin execution - reads execution id and original sender address from storage
    Contract.authorize(msg.sender);
    // Check that the token is initialized -
    Contract.checks(tokenInit);
    // Execute approval function -
    Approve.approve(_spender, _amount);
    // Ensures state change will only affect storage and events -
    Contract.checks(emitAndStore);
    // Commit state changes to storage -
    Contract.commit();
  }
}