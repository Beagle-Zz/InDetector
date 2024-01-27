contract c16818{
    /**
     * Get the Day-Index of the current Day for Mapping with OwnTheDay.io
     */
    function getDayIndex_(uint timestamp) internal view returns (uint256) {
        uint16[12] memory offset = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
        uint8 day = DateTimeLib_.getDay(timestamp);
        uint8 month = DateTimeLib_.getMonth(timestamp) - 1;
        bool isLeapYear = DateTimeLib_.isLeapYear(DateTimeLib_.getYear(timestamp));
        // OwnTheDay always includes Feb 29
        if (isLeapYear && month > 1) { day = day + 1; }
        return offset[month] + day;
    }
}