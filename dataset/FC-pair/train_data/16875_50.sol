contract c16875{
    /**
     * Get the Day-Index of the current Day for Mapping with OwnTheDay.io
     */
    function getDayIndex_(uint timestamp) internal view returns (uint256) {
        uint8 day = DateTimeLib_.getDay(timestamp);
        uint8 month = DateTimeLib_.getMonth(timestamp);
        // OwnTheDay always includes Feb 29
        uint16[12] memory offset = [0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335];
        return offset[month-1] + day;
    }
}