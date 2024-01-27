contract c18810{
    /* Update the given account's previous period fee entitlement value.
     * Do nothing if the last transfer occurred since the fee period rolled over.
     * If the entitlement was updated, also update the last transfer time to be
     * at the timestamp of the rollover, so if this should do nothing if called more
     * than once during a given period.
     *
     * Consider the case where the entitlement is updated. If the last transfer
     * occurred at time t in the last period, then the starred region is added to the
     * entitlement, the last transfer timestamp is moved to r, and the fee period is
     * rolled over from k-1 to k so that the new fee period start time is at time r.
     * 
     *   k-1       |        k
     *         s __|
     *  _  _ ___|**|
     *          |**|
     *  _  _ ___|**|___ __ _  _
     *             |
     *          t  |
     *             r
     * 
     * Similar computations are performed according to the fee period in which the
     * last transfer occurred.
     */
    function rolloverFee(address account, uint lastTransferTime, uint preBalance)
        internal
    {
        if (lastTransferTime < feePeriodStartTime) {
            if (lastTransferTime < lastFeePeriodStartTime) {
                // The last transfer predated the previous two fee periods.
                if (lastTransferTime < penultimateFeePeriodStartTime) {
                    // The balance did nothing in the penultimate fee period, so the average balance
                    // in this period is their pre-transfer balance.
                    penultimateAverageBalance[account] = preBalance;
                // The last transfer occurred within the one-before-the-last fee period.
                } else {
                    // No overflow risk here: the failed guard implies (penultimateFeePeriodStartTime <= lastTransferTime).
                    penultimateAverageBalance[account] = safeDiv(
                        safeAdd(currentBalanceSum[account], safeMul(preBalance, (lastFeePeriodStartTime - lastTransferTime))),
                        (lastFeePeriodStartTime - penultimateFeePeriodStartTime)
                    );
                }
                // The balance did nothing in the last fee period, so the average balance
                // in this period is their pre-transfer balance.
                lastAverageBalance[account] = preBalance;
            // The last transfer occurred within the last fee period.
            } else {
                // The previously-last average balance becomes the penultimate balance.
                penultimateAverageBalance[account] = lastAverageBalance[account];
                // No overflow risk here: the failed guard implies (lastFeePeriodStartTime <= lastTransferTime).
                lastAverageBalance[account] = safeDiv(
                    safeAdd(currentBalanceSum[account], safeMul(preBalance, (feePeriodStartTime - lastTransferTime))),
                    (feePeriodStartTime - lastFeePeriodStartTime)
                );
            }
            // Roll over to the next fee period.
            currentBalanceSum[account] = 0;
            hasWithdrawnLastPeriodFees[account] = false;
            lastTransferTimestamp[account] = feePeriodStartTime;
        }
    }
}