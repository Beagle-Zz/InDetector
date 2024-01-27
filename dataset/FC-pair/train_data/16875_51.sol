contract c16875{
    /**
     * Determine if Day-Index is a Holiday or not
     */
    function getHolidayByIndex_(uint256 _dayIndex) internal view returns (uint result) {
        if (_dayIndex < 122) {
            return getFromList_(0, _dayIndex);
        }
        if (_dayIndex < 244) {
            return getFromList_(1, _dayIndex-122);
        }
        return getFromList_(2, _dayIndex-244);
    }
}