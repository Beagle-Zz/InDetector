contract c13852{
    /**
     * @dev Calculate the operation fee for a given day
     * @notice Doesn't change state
     * @param _date Date to calculate the operation fee for (unix time: uint32)
     * @return Operation fee amount (unit256)
     */ 
    function calculateOperationFee(uint32 _date) internal view returns (uint256) {
        DailyContestStatus memory status = dateToContestStatus[_date];
        // if no one has completed, take all as operation fee
        if (status.numCompleted == 0) {
            return status.numRegistered.mul(REGISTRATION_FEE);
        }
        uint256 numFailed = status.numRegistered.sub(status.numCompleted);
        // 10% of forefeited deposits 
        return numFailed.mul(REGISTRATION_FEE).div(10);
    }
}