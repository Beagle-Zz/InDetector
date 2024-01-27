contract c7582{
    /**
     * @notice Approves spender to transfer on the message sender's behalf.
     */
    function approve(address spender, uint value)
        public
        optionalProxy
        returns (bool)
    {
        address sender = messageSender;
        tokenState.setAllowance(sender, spender, value);
        emitApproval(sender, spender, value);
        return true;
    }
}