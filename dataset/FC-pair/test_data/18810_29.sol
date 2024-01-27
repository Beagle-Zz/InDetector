contract c18810{
    // The quantity to send in order that the sender spends a certain value of tokens.
    function priceToSpend(uint value)
        external
        view
        returns (uint)
    {
        return safeDiv_dec(value, safeAdd(UNIT, transferFeeRate));
    }
}