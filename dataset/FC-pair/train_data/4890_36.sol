contract c4890{
    /// @notice Check policy details
    ///
    /// @return _groupNames group names included in policies
    /// @return _acceptLimits accept limit for group
    /// @return _declineLimits decline limit for group
    function getPolicyDetails(bytes4 _sig, address _contract)
    public
    view
    returns (
        bytes32[] _groupNames,
        uint[] _acceptLimits,
        uint[] _declineLimits,
        uint _totalAcceptedLimit,
        uint _totalDeclinedLimit
    ) {
        require(_sig != bytes4(0));
        require(_contract != 0x0);
        bytes32 _policyHash = keccak256(_sig, _contract);
        uint _policyIdx = policyId2Index[_policyHash];
        if (_policyIdx == 0) {
            return;
        }
        Policy storage _policy = policyId2policy[_policyHash];
        uint _policyGroupsCount = _policy.groupsCount;
        _groupNames = new bytes32[](_policyGroupsCount);
        _acceptLimits = new uint[](_policyGroupsCount);
        _declineLimits = new uint[](_policyGroupsCount);
        for (uint _idx = 0; _idx < _policyGroupsCount; ++_idx) {
            Requirements storage _requirements = _policy.participatedGroups[_idx + 1];
            _groupNames[_idx] = _requirements.groupName;
            _acceptLimits[_idx] = _requirements.acceptLimit;
            _declineLimits[_idx] = _requirements.declineLimit;
        }
        (_totalAcceptedLimit, _totalDeclinedLimit) = (_policy.totalAcceptedLimit, _policy.totalDeclinedLimit);
    }
}