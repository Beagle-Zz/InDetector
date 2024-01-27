contract c18810{
    /* Return the fee charged on a purchase or sale of n nomins. */
    function poolFeeIncurred(uint n)
        public
        view
        returns (uint)
    {
        return safeMul_dec(n, poolFeeRate);
    }
}