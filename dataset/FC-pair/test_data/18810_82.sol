contract c18810{
    /* Construct a vesting schedule to release a quantities of havvens
     * over a series of intervals. Assumes that the quantities are nonzero
     * and that the sequence of timestamps is strictly increasing. */
    function addVestingSchedule(address account, uint[] times, uint[] quantities)
        external
        onlyOwner
        setupFunction
    {
        for (uint i = 0; i < times.length; i++) {
            appendVestingEntry(account, times[i], quantities[i]);
        }
    }
}