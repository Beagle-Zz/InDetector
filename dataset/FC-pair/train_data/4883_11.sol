contract c4883{
    /// @notice Gets user balance that is deposited
    /// @param _userKey aggregated user key (user ID + role ID)
    /// @return an amount of tokens deposited on behalf of user
    function getUserBalance(bytes32 _userKey) public view returns (uint) {
        uint _lastPeriodForUser = user2lastPeriodParticipated[_userKey];
        if (_lastPeriodForUser == 0) {
            return 0;
        }
        if (_lastPeriodForUser <= periodsCount.sub(1)) {
            return periods[_lastPeriodForUser].user2balance[_userKey];
        }
        return periods[periodsCount].user2balance[_userKey];
    }
}