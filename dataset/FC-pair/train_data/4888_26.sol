contract c4888{
    /// @notice Gets total amount of deposits that has left after users' bonus withdrawals
    /// @return amount of deposits available for bonus payments
    function getTotalDepositsAmountLeft() public view returns (uint _amount) {
        uint _lastDepositDate = lastDepositDate;
        for (
            uint _startDate = firstDepositDate;
            _startDate <= _lastDepositDate || _startDate != 0;
            _startDate = distributionDeposits[_startDate].nextDepositDate
        ) {
            _amount = _amount.add(distributionDeposits[_startDate].left);
        }
    }
}