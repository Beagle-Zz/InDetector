contract c16818{
    //
    // Public Functions
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //
    /**
     * Checks if a specific day is a holiday at OwnTheDay.io
     */
    function isHoliday(uint256 _dayIndex) public view returns (bool) {
        require(_dayIndex >= 0 && _dayIndex < 366);
        return (getHolidayByIndex_(_dayIndex) == 1);
    }
}