contract c7581{
    /**
     * @notice Get the time at which a given schedule entry will vest.
     */
    function getVestingTime(address account, uint index)
        public
        view
        returns (uint)
    {
        return getVestingScheduleEntry(account,index)[TIME_INDEX];
    }
}