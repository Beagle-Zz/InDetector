contract c18688{
    /**
     * @dev    Called by the weekly oraclize callback. Checks raffle 10
     *         weeks older than current raffle for any unclaimed prize
     *         pool. If any found, returns it to the main prizePool and
     *         zeros the amount.
     */
    function reclaimUnclaimed() internal {
        uint old = getWeek() - 11;
        prizePool += raffle[old].unclaimed;
        emit LogReclaim(old, raffle[old].unclaimed, now);
    }
}