contract c13852{
    /**
     * @dev Calculate the bonus for a given day
     * @notice Doesn't change state
     * @param _date Date to calculate the bonus for (unix time: uint32)
     * @return Bonus amount (unit256)
     */ 
    function calculateBonus(uint32 _date) internal view returns (uint256) {
        DailyContestStatus memory status = dateToContestStatus[_date];
        if (status.numCompleted == 0) {
            return 0;
        }
        uint256 numFailed = status.numRegistered.sub(status.numCompleted);
        // Split 90% of the forfeited deposits between completed users
        return numFailed.mul(REGISTRATION_FEE).mul(9).div(
            status.numCompleted.mul(10)
        );
    }
}