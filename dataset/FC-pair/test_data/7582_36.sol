contract c7582{
    /**
     * @notice Ability to transfer where the sender pays the fees (not ERC20)
     */
    function _transferSenderPaysFee_byProxy(address sender, address to, uint value)
        internal
        returns (bool)
    {
        /* The fee is added to the amount sent. */
        uint fee = transferFeeIncurred(value);
        return _internalTransfer(sender, to, value, fee);
    }
}