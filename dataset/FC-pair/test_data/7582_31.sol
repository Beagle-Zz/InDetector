contract c7582{
    /**
     * @notice The amount the recipient will receive if you send a certain number of tokens.
     */
    function amountReceived(uint value)
        public
        view
        returns (uint)
    {
        return safeDiv_dec(value, safeAdd(UNIT, transferFeeRate));
    }
}