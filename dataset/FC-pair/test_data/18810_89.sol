contract c18810{
    /* Override ERC20 transferFrom function in order to perform
     * fee entitlement recomputation whenever balances are updated. */
    function transferFrom(address from, address to, uint value)
        external
        preCheckFeePeriodRollover
        optionalProxy
        returns (bool)
    {
        uint senderPreBalance = state.balanceOf(from);
        uint recipientPreBalance = state.balanceOf(to);
        // Perform the transfer: if there is a problem,
        // an exception will be thrown in this call.
        _transferFrom_byProxy(messageSender, from, to, value);
        // Zero-value transfers still update fee entitlement information,
        // and may roll over the fee period.
        adjustFeeEntitlement(from, senderPreBalance);
        adjustFeeEntitlement(to, recipientPreBalance);
        return true;
    }
}