contract c10120{
    // public view functions
    function lockedTokens(address _account) public view returns (uint) {
        if (!mayHaveLockedTokens[_account]) return 0;
        return pNumberOfLockedTokens(_account);
    }
}