contract c13852{
    /**
     * @dev Return registered days and statuses for a user
     * @notice Doesn't change state
     * @return Tupple of two arrays (dates registered, statuses)
     */
    function getUserEntryStatuses() external view returns (uint32[], uint32[]) {
        uint32[] memory dates = userToDates[msg.sender];
        uint256 datesLength = dates.length;
        uint32[] memory statuses = new uint32[](datesLength);
        for (uint256 i = 0; i < datesLength; i++) {
            statuses[i] = uint32(userDateToStatus[msg.sender][dates[i]]);
        }
        return (dates, statuses);
    }
}