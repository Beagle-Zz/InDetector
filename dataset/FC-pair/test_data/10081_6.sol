contract c10081{
    /// @notice Create group
    /// Can be called only by contract owner
    ///
    /// @param _groupName group name
    /// @param _priority group priority
    ///
    /// @return code
    function createGroup(bytes32 _groupName, uint _priority) external onlyContractOwner returns (uint) {
        require(_groupName != bytes32(0));
        if (isGroupExists(_groupName)) {
            return USER_MANAGER_GROUP_ALREADY_EXIST;
        }
        uint _groupsCount = groupsCount.add(1);
        groupName2index[_groupName] = _groupsCount;
        index2groupName[_groupsCount] = _groupName;
        groupName2group[_groupName] = Group(_groupName, _priority, 0);
        groupsCount = _groupsCount;
        GroupCreated(_groupName);
        return OK;
    }
}