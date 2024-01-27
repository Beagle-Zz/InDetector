contract c18810{
    /* Whatever calls this should have either the optionalProxy or onlyProxy modifier,
     * and pass in messageSender. */
    function _transferFrom_byProxy(address sender, address from, address to, uint value)
        internal
        returns (bool)
    {
        require(to != address(0));
        // The fee is deducted from the sender's balance, in addition to
        // the transferred quantity.
        uint fee = transferFeeIncurred(value);
        uint totalCharge = safeAdd(value, fee);
        // Insufficient balance will be handled by the safe subtraction.
        state.setBalanceOf(from, safeSub(state.balanceOf(from), totalCharge));
        state.setAllowance(from, sender, safeSub(state.allowance(from, sender), totalCharge));
        state.setBalanceOf(to, safeAdd(state.balanceOf(to), value));
        state.setBalanceOf(address(this), safeAdd(state.balanceOf(address(this)), fee));
        emit Transfer(from, to, value);
        emit TransferFeePaid(from, fee);
        emit Transfer(from, address(this), fee);
        return true;
    }
}