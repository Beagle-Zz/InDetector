contract c7581{
    /**
     * @notice ERC20 friendly transferFrom function.
     */
    function _transferFrom_byProxy(address sender, address from, address to, uint value)
        internal
        returns (bool)
    {
        /* The fee is deducted from the amount sent. */
        uint received = amountReceived(value);
        uint fee = safeSub(value, received);
        /* Reduce the allowance by the amount we're transferring.
         * The safeSub call will handle an insufficient allowance. */
        tokenState.setAllowance(from, sender, safeSub(tokenState.allowance(from, sender), value));
        return _internalTransfer(from, to, received, fee);
    }
}