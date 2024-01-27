contract c4900{
    /// @notice Check transaction status
    /// @param _key transaction id
    /// @return code
    function hasConfirmedRecord(bytes32 _key) public view returns (uint) {
        require(_key != bytes32(0));
        if (!isTxExist(_key)) {
            return NO_RECORDS_WERE_FOUND;
        }
        Guard storage _guard = txKey2guard[_key];
        return _guard.state == GuardState.InProcess
        ? PENDING_MANAGER_IN_PROCESS
        : _guard.state == GuardState.Confirmed
        ? OK
        : PENDING_MANAGER_REJECTED;
    }
}