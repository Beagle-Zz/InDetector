contract c11074{
    /// @notice Sets asset spending allowance for a specified spender.
    ///
    /// Note: to revoke allowance, one needs to set allowance to 0.
    ///
    /// @param _spenderId holder id to set allowance for.
    /// @param _value amount to allow.
    /// @param _symbol asset symbol.
    /// @param _senderId approve initiator holder id.
    ///
    /// @return success.
    function _approve(uint _spenderId, uint _value, bytes32 _symbol, uint _senderId) internal returns (uint) {
        // Asset should exist.
        if (!isCreated(_symbol)) {
            return _error(ATX_PLATFORM_ASSET_IS_NOT_ISSUED);
        }
        // Should allow to another holder.
        if (_senderId == _spenderId) {
            return _error(ATX_PLATFORM_CANNOT_APPLY_TO_ONESELF);
        }
        // Double Spend Attack checkpoint
        if (assets[_symbol].wallets[_senderId].allowance[_spenderId] != 0 && _value != 0) {
            return _error(ATX_PLATFORM_INVALID_INVOCATION);
        }
        assets[_symbol].wallets[_senderId].allowance[_spenderId] = _value;
        // Internal Out Of Gas/Throw: revert this transaction too;
        // Call Stack Depth Limit reached: revert this transaction too;
        // Recursive Call: safe, all changes already made.
        Emitter(eventsHistory).emitApprove(_address(_senderId), _address(_spenderId), _symbol, _value);
        if (proxies[_symbol] != 0x0) {
            // Internal Out Of Gas/Throw: revert this transaction too;
            // Call Stack Depth Limit reached: n/a after HF 4;
            // Recursive Call: safe, all changes already made.
            ProxyEventsEmitter(proxies[_symbol]).emitApprove(_address(_senderId), _address(_spenderId), _value);
        }
        return OK;
    }
}