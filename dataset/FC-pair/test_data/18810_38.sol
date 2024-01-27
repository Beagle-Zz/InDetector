contract c18810{
    /* Return the equivalent ether value of the given quantity
     * of fiat at the current price.
     * Reverts if the price is stale. */
    function etherValue(uint fiat)
        public
        view
        priceNotStale
        returns (uint)
    {
        return safeDiv_dec(fiat, etherPrice);
    }
}