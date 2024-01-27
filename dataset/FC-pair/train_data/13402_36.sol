contract c13402{
    /// @notice subscribe for a weekly recurring payment 
    /// @param _startTime Subscription start time.
    /// @param _payPerWeek weekly payment
    /// @param _recipient address of beneficiary
    /// @return true/false
    function subscribe(uint _startTime, uint _payPerWeek, address _recipient) public returns (bool) {
        require(_startTime >= block.timestamp);
        require(_payPerWeek != 0);
        require(_recipient != 0);
        subs[msg.sender][_recipient] = Sub(_startTime, _payPerWeek, _startTime);  
        emit LogSubscription(msg.sender, _recipient);
        return true;
    }
}