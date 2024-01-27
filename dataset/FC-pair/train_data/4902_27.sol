contract c4902{
    /// @notice Gets an amount of deposits that has left after users' bonus withdrawals for selected date
    /// @param _distributionDate date of distribution operation
    /// @return amount of deposits available for bonus payments for concrete distribution date
    function getDepositsAmountLeft(uint _distributionDate) public view returns (uint _amount) {
        return distributionDeposits[_distributionDate].left;
    }
}