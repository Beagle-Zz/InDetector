contract c13477{
  /**
   * @notice Called when tokens have to be burned (only after sale)
   * @param _tokens Amount of tokens to be burned
   */
  function burnTokens(uint256 _tokens) external {
    require(!locked);
    require(contractManager.authorize(contractName, msg.sender));
    require(depositAddress != address(0));
    require(_tokens != 0);
    require(_tokens <= balances[depositAddress]);
    balances[depositAddress] = balances[depositAddress].sub(_tokens);
    totalSupply_ = totalSupply_.sub(_tokens);
    emit TokensBurned(msg.sender, depositAddress, _tokens);
  }
}