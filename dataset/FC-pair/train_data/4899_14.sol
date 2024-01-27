contract c4899{
    /// @notice Gets total amount of bmc-day accumulated due provided date
    /// @param _date date where period ends
    /// @return an amount of bmc-days
    function getTotalBmcDaysAmount(uint _date) public view returns (uint) {
        return _getTotalBmcDaysAmount(_date, periodsCount);
    }
}