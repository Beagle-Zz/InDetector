contract c13400{
    /// @notice cancel a subcription. 
    /// @param _recipient address of beneficiary
    /// @return true/false
    function cancelSubscription(address _recipient) public returns (bool) {
        require(subs[msg.sender][_recipient].startTime != 0);
        require(subs[msg.sender][_recipient].payPerWeek != 0);
        subs[msg.sender][_recipient].startTime = 0;
        subs[msg.sender][_recipient].payPerWeek = 0;
        subs[msg.sender][_recipient].lastWithdrawTime = 0;
        emit LogCancelSubscription(msg.sender, _recipient);
        return true;
    }
}