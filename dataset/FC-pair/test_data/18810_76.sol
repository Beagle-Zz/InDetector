contract c18810{
    /* Obtain the next schedule entry that will vest for a given user.
     * The return value is a pair (timestamp, havven quantity) */
    function getNextVestingEntry(address account)
        external
        view
        returns (uint[2])
    {
        uint index = getNextVestingIndex(account);
        if (index == numVestingEntries(account)) {
            return [uint(0), 0];
        }
        return getVestingScheduleEntry(account, index);
    }
}