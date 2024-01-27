contract c18810{
    /* Return the ether cost (including fee) of purchasing n nomins.
     * Reverts if the price is stale. */
    function purchaseCostEther(uint n)
        public
        view
        returns (uint)
    {
        // Price staleness check occurs inside the call to etherValue.
        return etherValue(purchaseCostFiat(n));
    }
}