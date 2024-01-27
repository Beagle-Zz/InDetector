contract c18810{
    /* True if the contract is self-destructible. 
     * This is true if either the complete liquidation period has elapsed,
     * or if all tokens have been returned to the contract and it has been
     * in liquidation for at least a week.
     * Since the contract is only destructible after the liquidationTimestamp,
     * a fortiori canSelfDestruct() implies isLiquidating(). */
    function canSelfDestruct()
        public
        view
        returns (bool)
    {
        // Not being in liquidation implies the timestamp is uint max, so it would roll over.
        // We need to check whether we're in liquidation first.
        if (isLiquidating()) {
            // These timestamps and durations have values clamped within reasonable values and
            // cannot overflow.
            bool totalPeriodElapsed = liquidationTimestamp + liquidationPeriod < now;
            // Total supply of 0 means all tokens have returned to the pool.
            bool allTokensReturned = (liquidationTimestamp + 1 weeks < now) && (totalSupply == 0);
            return totalPeriodElapsed || allTokensReturned;
        }
        return false;
    }
}