contract c7582{
    /**
     * @notice Withdraw tokens from the fee pool into a given account.
     * @dev Only the fee authority may call this.
     */
    function withdrawFees(address account, uint value)
        external
        onlyFeeAuthority
        returns (bool)
    {
        require(account != address(0));
        /* 0-value withdrawals do nothing. */
        if (value == 0) {
            return false;
        }
        /* Safe subtraction ensures an exception is thrown if the balance is insufficient. */
        tokenState.setBalanceOf(FEE_ADDRESS, safeSub(tokenState.balanceOf(FEE_ADDRESS), value));
        tokenState.setBalanceOf(account, safeAdd(tokenState.balanceOf(account), value));
        emitFeesWithdrawn(account, value);
        emitTransfer(FEE_ADDRESS, account, value);
        return true;
    }
}