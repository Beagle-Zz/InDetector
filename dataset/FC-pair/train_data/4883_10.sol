contract c4883{
    /// @notice Gets shares (in percents) the user has on provided date
    ///
    /// @param _userKey aggregated user key (user ID + role ID)
    /// @param _date date where period ends
    ///
    /// @return percent from total amount of bmc-days the treasury has on this date.
    /// Use PERCENT_PRECISION to get right precision
    function getSharesPercentForPeriod(bytes32 _userKey, uint _date) public view returns (uint) {
        uint _periodIdx = periodDate2periodIdx[_date];
        if (_date != 0 && _periodIdx == 0) {
            return 0;
        }
        if (_date == 0) {
            _date = now;
            _periodIdx = periodsCount;
        }
        uint _bmcDays = _getBmcDaysAmountForUser(_userKey, _date, _periodIdx);
        uint _totalBmcDeposit = _getTotalBmcDaysAmount(_date, _periodIdx);
        return _totalBmcDeposit != 0 ? _bmcDays * PERCENT_PRECISION / _totalBmcDeposit : 0;
    }
}