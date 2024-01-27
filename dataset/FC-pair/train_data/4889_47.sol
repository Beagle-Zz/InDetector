contract c4889{
    /// @notice Revoke user votes for transaction
    /// Can be called only by contract owner
    ///
    /// @param _key transaction id
    /// @param _user target user address
    ///
    /// @return code
    function forceRejectVotes(bytes32 _key, address _user) external onlyContractOwner returns (uint) {
        return _revoke(_key, _user);
    }
}