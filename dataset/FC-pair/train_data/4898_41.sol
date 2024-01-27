contract c4898{
    /// @notice Register new policy rule
    /// Can be called only by contract owner
    ///
    /// @param _sig target method signature
    /// @param _contract target contract address
    /// @param _groupName group's name
    /// @param _acceptLimit accepted vote limit
    /// @param _declineLimit decline vote limit
    ///
    /// @return code
    function addPolicyRule(
        bytes4 _sig,
        address _contract,
        bytes32 _groupName,
        uint _acceptLimit,
        uint _declineLimit
    )
    onlyContractOwner
    external
    returns (uint)
    {
        require(_sig != 0x0);
        require(_contract != 0x0);
        require(GroupsAccessManager(accessManager).isGroupExists(_groupName));
        require(_acceptLimit != 0);
        require(_declineLimit != 0);
        bytes32 _policyHash = keccak256(_sig, _contract);
        if (policyId2Index[_policyHash] == 0) {
            uint _policiesCount = policiesCount.add(1);
            index2PolicyId[_policiesCount] = _policyHash;
            policyId2Index[_policyHash] = _policiesCount;
            policiesCount = _policiesCount;
        }
        Policy storage _policy = policyId2policy[_policyHash];
        uint _policyGroupsCount = _policy.groupsCount;
        if (_policy.groupName2index[_groupName] == 0) {
            _policyGroupsCount += 1;
            _policy.groupName2index[_groupName] = _policyGroupsCount;
            _policy.participatedGroups[_policyGroupsCount].groupName = _groupName;
            _policy.groupsCount = _policyGroupsCount;
        }
        uint _previousAcceptLimit = _policy.participatedGroups[_policyGroupsCount].acceptLimit;
        uint _previousDeclineLimit = _policy.participatedGroups[_policyGroupsCount].declineLimit;
        _policy.participatedGroups[_policyGroupsCount].acceptLimit = _acceptLimit;
        _policy.participatedGroups[_policyGroupsCount].declineLimit = _declineLimit;
        _policy.totalAcceptedLimit = _policy.totalAcceptedLimit.sub(_previousAcceptLimit).add(_acceptLimit);
        _policy.totalDeclinedLimit = _policy.totalDeclinedLimit.sub(_previousDeclineLimit).add(_declineLimit);
        PolicyRuleAdded(_sig, _contract, _policyHash, _groupName, _acceptLimit, _declineLimit);
        return OK;
    }
}