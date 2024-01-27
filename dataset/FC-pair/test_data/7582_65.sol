contract c7582{
    /* Allow havven to issue a certain number of
     * nomins from an account. */
    function issue(address account, uint amount)
        external
        onlyHavven
    {
        tokenState.setBalanceOf(account, safeAdd(tokenState.balanceOf(account), amount));
        totalSupply = safeAdd(totalSupply, amount);
        emitTransfer(address(0), account, amount);
        emitIssued(account, amount);
    }
}