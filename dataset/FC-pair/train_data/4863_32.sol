contract c4863{
    /// @notice Sign current transaction and add it to transaction pending queue
    ///
    /// @return code
    function _multisig(bytes32 _args, uint _block) internal returns (uint _code) {
        bytes32 _txHash = _getKey(_args, _block);
        address _manager = getPendingManager();
        _code = PendingManager(_manager).hasConfirmedRecord(_txHash);
        if (_code != NO_RECORDS_WERE_FOUND) {
            return _code;
        }
        if (OK != PendingManager(_manager).addTx(_txHash, msg.sig, address(this))) {
            revert();
        }
        return MULTISIG_ADDED;
    }
}