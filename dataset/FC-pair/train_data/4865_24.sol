contract c4865{
    /* PUBLIC */
    /// @notice Gets total amount of bonuses user has during all distribution periods
    /// @param _userKey aggregated user key (user ID + role ID)
    /// @return _sum available amount of bonuses to withdraw
    function getTotalBonusesAmountAvailable(bytes32 _userKey) public view returns (uint _sum) {
        uint _startDate = _getCalculationStartDate(_userKey);
        Treasury _treasury = Treasury(treasury);
        for (
            uint _endDate = lastDepositDate;
            _startDate <= _endDate && _startDate != 0;
            _startDate = distributionDeposits[_startDate].nextDepositDate
        ) {
            Deposit storage _pendingDeposit = distributionDeposits[_startDate];
            Balance storage _userBalance = _pendingDeposit.leftToWithdraw[_userKey];
            if (_userBalance.initialized) {
                _sum = _sum.add(_userBalance.left);
            } else {
                uint _sharesPercent = _treasury.getSharesPercentForPeriod(_userKey, _startDate);
                _sum = _sum.add(_pendingDeposit.balance.mul(_sharesPercent).div(PERCENT_PRECISION));
            }
        }
    }
}