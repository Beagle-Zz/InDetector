contract c7581{
    /**
     * @notice The number of vesting dates in an account's schedule.
     */
    function numVestingEntries(address account)
        public
        view
        returns (uint)
    {
        return vestingSchedules[account].length;
    }
}