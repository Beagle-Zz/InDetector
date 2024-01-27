contract c2445{
    /**
     * @dev Unfreeze the account
     * @param _accounts Given accounts
     */
    function unfreeze(address[] _accounts) public onlyOwnerOrManager {
        require(phase_i != PHASE_NOT_STARTED && phase_i != PHASE_FINISHED, "Bad phase");
        uint i;
        for (i = 0; i < _accounts.length; i++) {
            require(_accounts[i] != address(0), "Zero address");
            require(_accounts[i] != base_wallet, "Freeze self");
        }
        for (i = 0; i < _accounts.length; i++) {
            token.unfreeze(_accounts[i]);
        }
    }
}