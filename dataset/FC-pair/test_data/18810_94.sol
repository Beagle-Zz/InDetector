contract c18810{
    /* Recompute and return the sender's average balance information. */
    function recomputeLastAverageBalance()
        external
        optionalProxy
        returns (uint)
    {
        return _recomputeAccountLastAverageBalance(messageSender);
    }
}