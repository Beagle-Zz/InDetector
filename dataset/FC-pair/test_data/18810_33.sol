contract c18810{
    /* Withdraw tokens from the fee pool into a given account. */
    function withdrawFee(address account, uint value)
        external
        returns (bool)
    {
        require(msg.sender == feeAuthority && account != address(0));
        // 0-value withdrawals do nothing.
        if (value == 0) {
            return false;
        }
        // Safe subtraction ensures an exception is thrown if the balance is insufficient.
        state.setBalanceOf(address(this), safeSub(state.balanceOf(address(this)), value));
        state.setBalanceOf(account, safeAdd(state.balanceOf(account), value));
        emit FeesWithdrawn(account, account, value);
        emit Transfer(address(this), account, value);
        return true;
    }
}