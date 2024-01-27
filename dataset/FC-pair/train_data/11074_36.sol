contract c11074{
    /// @notice Destroys specified amount of senders asset tokens.
    ///
    /// @param _symbol asset symbol.
    /// @param _value amount of tokens to destroy.
    ///
    /// @return success.
    function revokeAsset(bytes32 _symbol, uint _value) public returns (uint) {
        // Should have positive value.
        if (_value == 0) {
            return _error(ATX_PLATFORM_INVALID_VALUE);
        }
        Asset storage asset = assets[_symbol];
        uint holderId = getHolderId(msg.sender);
        // Should have enough tokens.
        if (asset.wallets[holderId].balance < _value) {
            return _error(ATX_PLATFORM_NOT_ENOUGH_TOKENS);
        }
        asset.wallets[holderId].balance = asset.wallets[holderId].balance.sub(_value);
        asset.totalSupply = asset.totalSupply.sub(_value);
        // Internal Out Of Gas/Throw: revert this transaction too;
        // Call Stack Depth Limit reached: n/a after HF 4;
        // Recursive Call: safe, all changes already made.
        Emitter(eventsHistory).emitRevoke(_symbol, _value, _address(holderId));
        _proxyTransferEvent(holderId, 0, _value, _symbol);
        return OK;
    }
}