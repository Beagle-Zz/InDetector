contract c13518{
     /*
     * PUBLIC FUNCTIONS
     */
    /// @dev Locking period has passed - Locked tokens have turned into tradeable
    function claimTokens(address[] receipents)
        external
        onlyOwner
        canClaimed
    {        
        for (uint i = 0; i < receipents.length; i++) {
            address receipent = receipents[i];
            balances[receipent] = balances[receipent].add(lockedBalances[receipent]);
            lockedBalances[receipent] = 0;
        }
    }
}