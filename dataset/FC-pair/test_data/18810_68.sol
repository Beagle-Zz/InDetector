contract c18810{
    /* Anything calling this must apply the onlyProxy or optionalProxy modifiers.*/
    function _transferFrom_byProxy(address sender, address from, address to, uint value)
        internal
        returns (bool)
    {
        require(to != address(0));
        // Insufficient balance will be handled by the safe subtraction.
        state.setBalanceOf(from, safeSub(state.balanceOf(from), value));
        state.setAllowance(from, sender, safeSub(state.allowance(from, sender), value));
        state.setBalanceOf(to, safeAdd(state.balanceOf(to), value));
        emit Transfer(from, to, value);
        return true;
    }
}