contract c18810{
    /* The number of vesting dates in an account's schedule. */
    function numVestingEntries(address account)
        public
        view
        returns (uint)
    {
        return vestingSchedules[account].length;
    }
}