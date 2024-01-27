contract c16818{
    /**
     * Calculate the amount of Payout for the Day Owner (Holidays receive extra)
     */
    function calculateDayOwnerCut_(uint256 _price) internal view returns (uint256) {
        if (getHolidayByIndex_(getDayIndex_(now)) == 1) {
            return _price.mul(25).div(100);
        }
        return _price.mul(10).div(100);
    }
}