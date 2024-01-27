contract c13852{
    /**
     * @dev Get daily contest status, admin only
     * @notice Doesn't change state
     * @param _date Date to get DailyContestStatus for
     * @return Tuple(uint256, uint256, bool)
     */
    function getContestStatusForDateAdmin(uint32 _date)
    external view returns (uint256, uint256, bool) {
        if (!adminPermission[msg.sender]) {
            return (0, 0, false);
        }
        DailyContestStatus memory dailyContestStatus = dateToContestStatus[_date];
        return (
            dailyContestStatus.numRegistered,
            dailyContestStatus.numCompleted,
            dailyContestStatus.operationFeeWithdrawn
        );
    }
}