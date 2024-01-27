contract c16875{
    /**
     * Gets the Day-Index of Today at OwnTheDay.io
     */
    function getTodayIndex() public view returns (uint256) {
        return getDayIndex_(now);
    }
}