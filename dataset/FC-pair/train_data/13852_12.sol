contract c13852{
    /**
     * @dev Calculate dates that a user can withdraw his/her deposit
     * array may contain zeros so those need to be filtered out by the client
     * @notice Doesn't change state
     * @return Array of dates (unix time: uint32)
     */
    function getWithdrawableDates() external view returns(uint32[]) {
        uint32[] memory dates = userToDates[msg.sender];
        uint256 datesLength = dates.length;
        // We can't initialize a mutable array in memory, so creating an array
        // with length set as the number of regsitered days
        uint32[] memory withdrawableDates = new uint32[](datesLength);
        uint256 index = 0;
        uint32 now32 = uint32(now);
        for (uint256 i = 0; i < datesLength; i++) {
            uint32 date = dates[i];
            // if it hasn't been more than 1.5 days since the entry, skip
            if (now32 <= date.add(WITHDRAW_BUFFER)) {
                continue;
            }
            // if the entry status is anything other than COMPLETED, skip
            if (userDateToStatus[msg.sender][date] != UserEntryStatus.COMPLETED) {
                continue;
            }
            withdrawableDates[index] = date;
            index += 1;
        }
        // this array may contain zeroes at the end of the array
        return withdrawableDates;
    }
}