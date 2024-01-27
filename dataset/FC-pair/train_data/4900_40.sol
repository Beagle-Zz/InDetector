contract c4900{
    /// @notice Update pending manager address
    ///
    /// @param _pendingManager pending manager address
    ///
    /// @return result code of an operation
    function updatePendingManager(address _pendingManager, uint _block) public returns (uint _code) {
        _code = _multisig(keccak256(_pendingManager), _block);
        if (OK != _code) {
            return _code;
        }
        pendingManager = _pendingManager;
        return OK;
    }
}