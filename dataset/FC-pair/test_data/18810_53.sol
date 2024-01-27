contract c18810{
    /* Issues n nomins into the pool available to be bought by users.
     * Must be accompanied by $n worth of ether.
     * Exceptional conditions:
     *     Not called by contract owner.
     *     Insufficient backing funds provided (post-issuance collateralisation below minimum requirement).
     *     Price is stale. */
    function replenishPool(uint n)
        external
        payable
        notLiquidating
        optionalProxy_onlyOwner
    {
        // Price staleness check occurs inside the call to fiatBalance.
        // Safe additions are unnecessary here, as either the addition is checked on the following line
        // or the overflow would cause the requirement not to be satisfied.
        require(fiatBalance() >= safeMul_dec(safeAdd(_nominCap(), n), MINIMUM_ISSUANCE_RATIO));
        nominPool = safeAdd(nominPool, n);
        emit PoolReplenished(n, msg.value);
    }
}