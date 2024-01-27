contract c18810{
    /* Sends n nomins to the sender from the pool, in exchange for
     * $n plus the fee worth of ether.
     * Exceptional conditions:
     *     Insufficient or too many funds provided.
     *     More nomins requested than are in the pool.
     *     n below the purchase minimum (1 cent).
     *     contract in liquidation.
     *     Price is stale. */
    function buy(uint n)
        external
        payable
        notLiquidating
        optionalProxy
    {
        // Price staleness check occurs inside the call to purchaseEtherCost.
        require(n >= MINIMUM_PURCHASE &&
                msg.value == purchaseCostEther(n));
        address sender = messageSender;
        // sub requires that nominPool >= n
        nominPool = safeSub(nominPool, n);
        state.setBalanceOf(sender, safeAdd(state.balanceOf(sender), n));
        emit Purchased(sender, sender, n, msg.value);
        emit Transfer(0, sender, n);
        totalSupply = safeAdd(totalSupply, n);
    }
}