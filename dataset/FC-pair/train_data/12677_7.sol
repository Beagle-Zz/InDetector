contract c12677{
    /**
     * @dev Initiate conflict resolution contract update.
     * @param _newConflictResAddress New conflict resolution contract address.
     */
    function updateConflictResolution(address _newConflictResAddress) public onlyOwner {
        newConflictRes = _newConflictResAddress;
        updateTime = block.timestamp;
        emit LogUpdatingConflictResolution(_newConflictResAddress);
    }
}