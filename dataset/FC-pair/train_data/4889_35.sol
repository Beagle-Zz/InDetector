contract c4889{
    /// @notice Get current group names
    ///
    /// @return group names
    function getGroups() public view returns (bytes32[] _groups) {
        uint _groupsCount = groupsCount;
        _groups = new bytes32[](_groupsCount);
        for (uint _groupIdx = 0; _groupIdx < _groupsCount; ++_groupIdx) {
            _groups[_groupIdx] = index2groupName[_groupIdx + 1];
        }
    }
}