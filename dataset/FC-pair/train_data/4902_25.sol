contract c4902{
    /// @notice Gets an amount of bonuses user has for concrete distribution date
    /// @param _userKey aggregated user key (user ID + role ID)
    /// @param _distributionDate date of distribution operation
    /// @return available amount of bonuses to withdraw for selected distribution date
    function getBonusesAmountAvailable(bytes32 _userKey, uint _distributionDate) public view returns (uint) {
        Deposit storage _deposit = distributionDeposits[_distributionDate];
        if (_deposit.leftToWithdraw[_userKey].initialized) {
            return _deposit.leftToWithdraw[_userKey].left;
        }
        uint _sharesPercent = Treasury(treasury).getSharesPercentForPeriod(_userKey, _distributionDate);
        return _deposit.balance.mul(_sharesPercent).div(PERCENT_PRECISION);
    }
}