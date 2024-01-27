contract c18810{
    /* Obtain the time at which the next schedule entry will vest for a given user. */
    function getNextVestingTime(address account)
        external
        view
        returns (uint)
    {
        uint index = getNextVestingIndex(account);
        if (index == numVestingEntries(account)) {
            return 0;
        }
        return getVestingTime(account, index);
    }
}