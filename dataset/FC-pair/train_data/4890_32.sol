contract c4890{
    /// @notice Decline transaction
    /// Can be called only by registered user in GroupsAccessManager
    ///
    /// @param _key transaction id
    ///
    /// @return code
    function decline(bytes32 _key, bytes32 _votingGroupName) external returns (uint) {
        if (!isTxExist(_key)) {
            return _emitError(PENDING_MANAGER_TX_DOESNT_EXIST);
        }
        if (!GroupsAccessManager(accessManager).isUserInGroup(_votingGroupName, msg.sender)) {
            return _emitError(PENDING_MANAGER_INVALID_INVOCATION);
        }
        Guard storage _guard = txKey2guard[_key];
        if (_guard.state != GuardState.InProcess) {
            return _emitError(PENDING_MANAGER_INVALID_INVOCATION);
        }
        if (_guard.votes[msg.sender].groupName != bytes32(0) && !_guard.votes[msg.sender].accepted) {
            return _emitError(PENDING_MANAGER_INVALID_INVOCATION);
        }
        Policy storage _policy = policyId2policy[index2PolicyId[_guard.basePolicyIndex]];
        uint _policyGroupIndex = _policy.groupName2index[_votingGroupName];
        uint _groupDeclinedVotesCount = _guard.declinedCount[_votingGroupName];
        if (_groupDeclinedVotesCount == _policy.participatedGroups[_policyGroupIndex].declineLimit) {
            return _emitError(PENDING_MANAGER_INVALID_INVOCATION);
        }
        _guard.votes[msg.sender] = Vote(_votingGroupName, false);
        _guard.declinedCount[_votingGroupName] = _groupDeclinedVotesCount + 1;
        uint _alreadyDeclinedCount = _guard.alreadyDeclined + 1;
        _guard.alreadyDeclined = _alreadyDeclinedCount;
        ProtectionTxDeclined(_key, msg.sender, _votingGroupName);
        if (_alreadyDeclinedCount == _policy.totalDeclinedLimit) {
            _guard.state = GuardState.Decline;
            ProtectionTxCancelled(_key);
        }
        return OK;
    }
}