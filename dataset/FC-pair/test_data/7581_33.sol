contract c7581{
    /* ========== MUTATIVE FUNCTIONS ========== */
    /**
     * @notice Base of transfer functions
     */
    function _internalTransfer(address from, address to, uint amount, uint fee)
        internal
        returns (bool)
    {
        /* Disallow transfers to irretrievable-addresses. */
        require(to != address(0));
        require(to != address(this));
        require(to != address(proxy));
        /* Insufficient balance will be handled by the safe subtraction. */
        tokenState.setBalanceOf(from, safeSub(tokenState.balanceOf(from), safeAdd(amount, fee)));
        tokenState.setBalanceOf(to, safeAdd(tokenState.balanceOf(to), amount));
        tokenState.setBalanceOf(FEE_ADDRESS, safeAdd(tokenState.balanceOf(FEE_ADDRESS), fee));
        /* Emit events for both the transfer itself and the fee. */
        emitTransfer(from, to, amount);
        emitTransfer(from, FEE_ADDRESS, fee);
        return true;
    }
}