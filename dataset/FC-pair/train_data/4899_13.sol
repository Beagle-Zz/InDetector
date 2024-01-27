contract c4899{
    /// @notice Gets list of locked up deposits with dates when they will be available to withdraw
    /// @param _userKey aggregated user key (user ID + role ID)
    /// @return {
    ///     "_lockupDates": "list of lockup dates of deposits",
    ///     "_deposits": "list of deposits"
    /// }
    function getLockedUserDeposits(bytes32 _userKey) public view returns (uint[] _lockupDates, uint[] _deposits) {
        LockedDeposits storage _lockedDeposits = user2lockedDeposits[_userKey];
        uint _lockedDepositsCounter = _lockedDeposits.counter;
        _lockupDates = new uint[](_lockedDepositsCounter);
        _deposits = new uint[](_lockedDepositsCounter);
        uint _pointer = 0;
        for (uint _idx = 1; _idx < _lockedDepositsCounter; ++_idx) {
            uint _lockDate = _lockedDeposits.index2Date[_idx];
            if (_lockDate > now) {
                _lockupDates[_pointer] = _lockDate;
                _deposits[_pointer] = _lockedDeposits.date2deposit[_lockDate];
                ++_pointer;
            }
        }
    }
}