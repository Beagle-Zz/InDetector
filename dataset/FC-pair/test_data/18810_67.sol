contract c18810{
    /* Anything calling this must apply the onlyProxy or optionalProxy modifiers.*/
    function _transfer_byProxy(address sender, address to, uint value)
        internal
        returns (bool)
    {
        require(to != address(0));
        // Insufficient balance will be handled by the safe subtraction.
        state.setBalanceOf(sender, safeSub(state.balanceOf(sender), value));
        state.setBalanceOf(to, safeAdd(state.balanceOf(to), value));
        emit Transfer(sender, to, value);
        return true;
    }
}