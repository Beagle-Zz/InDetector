contract c4862{
    /// @notice Check is group exist
    ///
    /// @param _groupName group name
    ///
    /// @return status
    function isGroupExists(bytes32 _groupName) public view returns (bool) {
        return groupName2index[_groupName] != 0;
    }
}