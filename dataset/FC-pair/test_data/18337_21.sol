contract c18337{
  //
  // Migrate tokens to the new token contract.
  //
  function migrate() public {
    require(migrationTarget != address(0));
    uint256 _amount = balances[msg.sender];
    require(_amount > 0);
    balances[msg.sender] = 0;
    totalSupply = totalSupply - _amount;
    outstandingQuarters = outstandingQuarters - _amount;
    rewards[msg.sender] = 0;
    trueBuy[msg.sender] = 0;
    developers[msg.sender] = false;
    emit Migrate(msg.sender, _amount);
    MigrationTarget(migrationTarget).migrateFrom(msg.sender, _amount, rewards[msg.sender], trueBuy[msg.sender], developers[msg.sender]);
  }
}