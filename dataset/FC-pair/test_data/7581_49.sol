contract c7581{
    /**
     * @notice Obtain the time at which the next schedule entry will vest for a given user.
     */
    function getNextVestingTime(address account)
        external
        view
        returns (uint)
    {
        return getNextVestingEntry(account)[TIME_INDEX];
    }
}