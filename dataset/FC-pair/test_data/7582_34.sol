contract c7582{
    /**
     * @notice ERC20 friendly transfer function.
     */
    function _transfer_byProxy(address sender, address to, uint value)
        internal
        returns (bool)
    {
        uint received = amountReceived(value);
        uint fee = safeSub(value, received);
        return _internalTransfer(sender, to, received, fee);
    }
}