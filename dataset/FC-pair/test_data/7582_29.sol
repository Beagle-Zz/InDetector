contract c7582{
    /* ========== VIEWS ========== */
    /**
     * @notice Calculate the Fee charged on top of a value being sent
     * @return Return the fee charged
     */
    function transferFeeIncurred(uint value)
        public
        view
        returns (uint)
    {
        return safeMul_dec(value, transferFeeRate);
        /* Transfers less than the reciprocal of transferFeeRate should be completely eaten up by fees.
         * This is on the basis that transfers less than this value will result in a nil fee.
         * Probably too insignificant to worry about, but the following code will achieve it.
         *      if (fee == 0 && transferFeeRate != 0) {
         *          return _value;
         *      }
         *      return fee;
         */
    }
}