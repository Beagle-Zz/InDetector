contract c7582{
    /**
     * @notice Ability to transferFrom where they sender pays the fees (not ERC20).
     */
    function _transferFromSenderPaysFee_byProxy(address sender, address from, address to, uint value)
        internal
        returns (bool)
    {
        /* The fee is added to the amount sent. */
        uint fee = transferFeeIncurred(value);
        uint total = safeAdd(value, fee);
        /* Reduce the allowance by the amount we're transferring. */
        tokenState.setAllowance(from, sender, safeSub(tokenState.allowance(from, sender), total));
        return _internalTransfer(from, to, value, fee);
    }
}