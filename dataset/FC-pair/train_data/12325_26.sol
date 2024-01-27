contract c12325{
    /// @dev Returns number of tokens owned by given address.
    /// @param _owner Address of token owner.
    function burnTokens(address _owner) public
        onlyCrowdsaleManager
    {
        // Available only during migration phase
        require(currentPhase == Phase.Migrating);
        uint tokens = balanceOf[_owner];
        require(tokens != 0);
        balanceOf[_owner] = 0;
        totalSupply -= tokens;
        emit LogBurn(_owner, tokens);
        emit Transfer(_owner, crowdsaleManager, tokens);
        // Automatically switch phase when migration is done.
        if (totalSupply == 0) {
            currentPhase = Phase.Migrated;
            emit LogPhaseSwitch(Phase.Migrated);
        }
    }
}