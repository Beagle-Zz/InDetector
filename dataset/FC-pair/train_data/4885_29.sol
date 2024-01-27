contract c4885{
    /// @notice Check policy include target group
    /// @param _policyHash policy hash (sig, contract address)
    /// @param _groupName group id
    /// @return bool
    function isGroupInPolicy(bytes32 _policyHash, bytes32 _groupName) public view returns (bool) {
        Policy storage _policy = policyId2policy[_policyHash];
        return _policy.groupName2index[_groupName] != 0;
    }
}