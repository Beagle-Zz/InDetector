contract c7582{
    /**
     * @notice Donate tokens from the sender's balance into the fee pool.
     */
    function donateToFeePool(uint n)
        external
        optionalProxy
        returns (bool)
    {
        address sender = messageSender;
        /* Empty donations are disallowed. */
        uint balance = tokenState.balanceOf(sender);
        require(balance != 0);
        /* safeSub ensures the donor has sufficient balance. */
        tokenState.setBalanceOf(sender, safeSub(balance, n));
        tokenState.setBalanceOf(FEE_ADDRESS, safeAdd(tokenState.balanceOf(FEE_ADDRESS), n));
        emitFeesDonated(sender, n);
        emitTransfer(sender, FEE_ADDRESS, n);
        return true;
    }
}