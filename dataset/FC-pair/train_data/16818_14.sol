contract c16818{
    /**
     * Checks if Today is a holiday at OwnTheDay.io
     */
    function isHolidayToday() public view returns (bool) {
        uint256 _dayIndex = getDayIndex_(now);
        return (getHolidayByIndex_(_dayIndex) == 1);
    }
}