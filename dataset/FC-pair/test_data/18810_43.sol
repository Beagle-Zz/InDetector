contract c18810{
    /* Return the fiat cost (including fee) of purchasing n nomins.
     * Nomins are purchased for $1, plus the fee. */
    function purchaseCostFiat(uint n)
        public
        view
        returns (uint)
    {
        return safeAdd(n, poolFeeIncurred(n));
    }
}