contract c18810{
    /* Recompute and return the given account's average balance information.
     * This also rolls over the fee period if necessary, and brings
     * the account's current balance sum up to date. */
    function _recomputeAccountLastAverageBalance(address account)
        internal
        preCheckFeePeriodRollover
        returns (uint)
    {
        adjustFeeEntitlement(account, state.balanceOf(account));
        return lastAverageBalance[account];
    }
}