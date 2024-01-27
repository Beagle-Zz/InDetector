contract c18810{
    /* Return the fiat proceeds (less the fee) of selling n nomins.
     * Nomins are sold for $1, minus the fee. */
    function saleProceedsFiat(uint n)
        public
        view
        returns (uint)
    {
        return safeSub(n, poolFeeIncurred(n));
    }
}