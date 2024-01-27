contract c18810{
    /* The same as etherValue(), but without the stale price check. */
    function etherValueAllowStale(uint fiat) 
        internal
        view
        returns (uint)
    {
        return safeDiv_dec(fiat, etherPrice);
    }
}