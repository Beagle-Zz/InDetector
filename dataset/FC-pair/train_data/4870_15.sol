contract c4870{
    /// @notice Change group status
    /// Can be called only by contract owner
    ///
    /// @param _groupName group name
    /// @param _blocked block status
    ///
    /// @return code
    function changeGroupActiveStatus(bytes32 _groupName, bool _blocked) external onlyContractOwner returns (uint) {
        require(isGroupExists(_groupName));
        groupsBlocked[_groupName] = _blocked;
        return OK;
    }
}