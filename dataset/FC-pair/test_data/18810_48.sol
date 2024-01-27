contract c18810{
    /* True iff the current block timestamp is later than the time
     * the price was last updated, plus the stale period. */
    function priceIsStale()
        public
        view
        returns (bool)
    {
        return safeAdd(lastPriceUpdateTime, stalePeriod) < now;
    }
}