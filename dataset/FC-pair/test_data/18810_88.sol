contract c18810{
    /* Anything calling this must apply the optionalProxy or onlyProxy modifier. */
    function _transfer(address sender, address to, uint value)
        internal
        preCheckFeePeriodRollover
        returns (bool)
    {
        uint senderPreBalance = state.balanceOf(sender);
        uint recipientPreBalance = state.balanceOf(to);
        // Perform the transfer: if there is a problem,
        // an exception will be thrown in this call.
        _transfer_byProxy(sender, to, value);
        // Zero-value transfers still update fee entitlement information,
        // and may roll over the fee period.
        adjustFeeEntitlement(sender, senderPreBalance);
        adjustFeeEntitlement(to, recipientPreBalance);
        return true;
    }
}