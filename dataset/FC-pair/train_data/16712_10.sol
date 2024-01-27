contract c16712{
    // Token migration support:
    /// @notice Migrate tokens to the new token contract.
    /// @dev Required state: Operational Migration
    /// @param _value The amount of token to be migrated
    function migrate(uint256 _value) external {
        // Abort if not in Operational Migration state.
        if (migrationAgent == 0) 
            revert();
        // Validate input value.
        if (_value == 0) 
            revert();
        if (_value > balances[msg.sender]) 
            revert();
        balances[msg.sender] -= _value;
        totalSupply -= _value;
        totalMigrated += _value;
        MigrationAgent(migrationAgent).migrateFrom(msg.sender, _value);
        Migrate(msg.sender, migrationAgent, _value);
    }
}