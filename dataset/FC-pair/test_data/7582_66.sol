contract c7582{
    /* Allow havven to burn a certain number of
     * nomins from an account. */
    function burn(address account, uint amount)
        external
        onlyHavven
    {
        tokenState.setBalanceOf(account, safeSub(tokenState.balanceOf(account), amount));
        totalSupply = safeSub(totalSupply, amount);
        emitTransfer(account, address(0), amount);
        emitBurned(account, amount);
    }
}