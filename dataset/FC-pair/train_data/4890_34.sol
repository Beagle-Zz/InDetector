contract c4890{
    /// @notice Revoke vote for transaction
    /// Can be called only by authorized user
    /// @param _key transaction id
    /// @return code
    function revoke(bytes32 _key) external returns (uint) {
        return _revoke(_key, msg.sender);
    }
}