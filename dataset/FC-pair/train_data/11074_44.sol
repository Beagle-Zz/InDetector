contract c11074{
    /// @notice Transfers asset balance between holders wallets.
    ///
    /// @dev Performs sanity checks and takes care of allowances adjustment.
    ///
    /// @param _fromId holder id to take from.
    /// @param _toId holder id to give to.
    /// @param _value amount to transfer.
    /// @param _symbol asset symbol.
    /// @param _reference transfer comment to be included in a Transfer event.
    /// @param _senderId transfer initiator holder id.
    ///
    /// @return success.
    function _transfer(uint _fromId, uint _toId, uint _value, bytes32 _symbol, string _reference, uint _senderId) internal returns (uint) {
        // Should not allow to send to oneself.
        if (_fromId == _toId) {
            return _error(ATX_PLATFORM_CANNOT_APPLY_TO_ONESELF);
        }
        // Should have positive value.
        if (_value == 0) {
            return _error(ATX_PLATFORM_INVALID_VALUE);
        }
        // Should have enough balance.
        if (_balanceOf(_fromId, _symbol) < _value) {
            return _error(ATX_PLATFORM_INSUFFICIENT_BALANCE);
        }
        // Should have enough allowance.
        if (_fromId != _senderId && _allowance(_fromId, _senderId, _symbol) < _value) {
            return _error(ATX_PLATFORM_NOT_ENOUGH_ALLOWANCE);
        }
        _transferDirect(_fromId, _toId, _value, _symbol);
        // Adjust allowance.
        if (_fromId != _senderId) {
            assets[_symbol].wallets[_fromId].allowance[_senderId] = assets[_symbol].wallets[_fromId].allowance[_senderId].sub(_value);
        }
        // Internal Out Of Gas/Throw: revert this transaction too;
        // Call Stack Depth Limit reached: n/a after HF 4;
        // Recursive Call: safe, all changes already made.
        Emitter(eventsHistory).emitTransfer(_address(_fromId), _address(_toId), _symbol, _value, _reference);
        _proxyTransferEvent(_fromId, _toId, _value, _symbol);
        return OK;
    }
}