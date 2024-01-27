contract c10164{
    // internal and private functions
    function unlockedTokensInternal(address _account) internal returns (uint) {
        // updates mayHaveLockedTokens if necessary
        if (!mayHaveLockedTokens[_account]) return balances[_account];
        uint locked = pNumberOfLockedTokens(_account);
        if (locked == 0) mayHaveLockedTokens[_account] = false;
        return balances[_account].sub(locked);
    }
}