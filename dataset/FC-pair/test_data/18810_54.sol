contract c18810{
    /* Burns n nomins from the pool.
     * Exceptional conditions:
     *     Not called by contract owner.
     *     There are fewer than n nomins in the pool. */
    function diminishPool(uint n)
        external
        optionalProxy_onlyOwner
    {
        // Require that there are enough nomins in the accessible pool to burn
        require(nominPool >= n);
        nominPool = safeSub(nominPool, n);
        emit PoolDiminished(n);
    }
}