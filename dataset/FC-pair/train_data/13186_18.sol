contract c13186{
    /**
     * ERC20 specific 'approve' is only allowed, if contract is not in paused state.
    **/
    function approve(address spender, uint256 amount) public whenNotPaused returns (bool) {
        return super.approve(spender, amount);
    }
}