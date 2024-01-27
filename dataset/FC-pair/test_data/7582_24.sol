contract c7582{
    /**
     * @dev Perform an ERC20 token transfer. Designed to be called by transfer functions possessing
     * the onlyProxy or optionalProxy modifiers.
     */
    function _transfer_byProxy(address from, address to, uint value)
        internal
        returns (bool)
    {
        return _internalTransfer(from, to, value);
    }
}