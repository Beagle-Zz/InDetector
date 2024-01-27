contract c4870{
    /// @notice Add users in group
    /// Can be called only by contract owner
    ///
    /// @param _groupName group name
    /// @param _users user array
    ///
    /// @return code
    function addUsersToGroup(bytes32 _groupName, address[] _users) external onlyContractOwner returns (uint) {
        require(isGroupExists(_groupName));
        Group storage _group = groupName2group[_groupName];
        uint _groupMembersCount = _group.membersCount;
        for (uint _userIdx = 0; _userIdx < _users.length; ++_userIdx) {
            address _user = _users[_userIdx];
            uint _memberIndex = memberAddress2index[_user];
            require(_memberIndex != 0);
            if (_group.memberAddress2index[_user] != 0) {
                continue;
            }
            _groupMembersCount = _groupMembersCount.add(1);
            _group.memberAddress2index[_user] = _groupMembersCount;
            _group.index2globalIndex[_groupMembersCount] = _memberIndex;
            _addGroupToMember(_user, _groupName);
            UserToGroupAdded(_user, _groupName);
        }
        _group.membersCount = _groupMembersCount;
        return OK;
    }
}