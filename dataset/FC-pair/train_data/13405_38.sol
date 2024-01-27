contract c13405{
    /// @notice get subcription details
    /// @param _owner 
    /// @param _recipient 
    /// @return startTime, payPerWeek, lastWithdrawTime
    function getSubscription(address _owner, address _recipient) public constant
        returns (uint startTime, uint payPerWeek, uint lastWithdrawTime) 
    {
        Sub storage sub = subs[_owner][_recipient];
        return (
            sub.startTime,
            sub.payPerWeek,
            sub.lastWithdrawTime
        );
    }
}