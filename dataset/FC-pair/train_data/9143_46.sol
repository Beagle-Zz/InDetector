contract c9143{
    /// @notice Remove policy rule
    /// Can be called only by contract owner
    ///
    /// @param _groupName group's name
    ///
    /// @return code
    function removePolicyRule(
        bytes4 _sig,
        address _contract,
        bytes32 _groupName
    ) 
    onlyContractOwner 
    external 
    returns (uint) 
    {
        require(_sig != bytes4(0));
        require(_contract != 0x0);
        require(GroupsAccessManager(accessManager).isGroupExists(_groupName));
        bytes32 _policyHash = keccak256(_sig, _contract);
        Policy storage _policy = policyId2policy[_policyHash];
        uint _policyGroupNameIndex = _policy.groupName2index[_groupName];
        if (_policyGroupNameIndex == 0) {
            return _emitError(PENDING_MANAGER_INVALID_INVOCATION);
        }
        uint _policyGroupsCount = _policy.groupsCount;
        if (_policyGroupNameIndex != _policyGroupsCount) {
            Requirements storage _requirements = _policy.participatedGroups[_policyGroupsCount];
            _policy.participatedGroups[_policyGroupNameIndex] = _requirements;
            _policy.groupName2index[_requirements.groupName] = _policyGroupNameIndex;
        }
        _policy.totalAcceptedLimit = _policy.totalAcceptedLimit.sub(_policy.participatedGroups[_policyGroupsCount].acceptLimit);
        _policy.totalDeclinedLimit = _policy.totalDeclinedLimit.sub(_policy.participatedGroups[_policyGroupsCount].declineLimit);
        delete _policy.groupName2index[_groupName];
        delete _policy.participatedGroups[_policyGroupsCount];
        _policy.groupsCount = _policyGroupsCount.sub(1);
        PolicyRuleRemoved(_sig, _contract, _policyHash, _groupName);
        return OK;
    }
}