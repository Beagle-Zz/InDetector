contract c18810{
    /* Recompute and return the given account's average balance information. */
    function recomputeAccountLastAverageBalance(address account)
        external
        returns (uint)
    {
        return _recomputeAccountLastAverageBalance(account);
    }
}