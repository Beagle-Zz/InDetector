contract c7581{
    /**
     * @notice Get a particular schedule entry for an account.
     * @return A pair of uints: (timestamp, havven quantity).
     */
    function getVestingScheduleEntry(address account, uint index)
        public
        view
        returns (uint[2])
    {
        return vestingSchedules[account][index];
    }
}