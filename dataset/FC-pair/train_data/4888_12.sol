contract c4888{
    /// @notice Gets amount of locked deposits for user
    /// @param _userKey aggregated user key (user ID + role ID)
    /// @return an amount of tokens locked
    function getLockedUserBalance(bytes32 _userKey) public returns (uint) {
        return _syncLockedDepositsAmount(_userKey);
    }
}