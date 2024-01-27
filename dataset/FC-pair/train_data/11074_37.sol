contract c11074{
    /// @notice Passes asset ownership to specified address.
    ///
    /// Only ownership is changed, balances are not touched.
    /// Can only be called by asset owner.
    ///
    /// @param _symbol asset symbol.
    /// @param _newOwner address to become a new owner.
    ///
    /// @return success.
    function changeOwnership(bytes32 _symbol, address _newOwner) public onlyOwner(_symbol) returns (uint) {
        if (_newOwner == 0x0) {
            return _error(ATX_PLATFORM_INVALID_NEW_OWNER);
        }
        Asset storage asset = assets[_symbol];
        uint newOwnerId = _createHolderId(_newOwner);
        // Should pass ownership to another holder.
        if (asset.owner == newOwnerId) {
            return _error(ATX_PLATFORM_CANNOT_APPLY_TO_ONESELF);
        }
        address oldOwner = _address(asset.owner);
        asset.owner = newOwnerId;
        // Internal Out Of Gas/Throw: revert this transaction too;
        // Call Stack Depth Limit reached: n/a after HF 4;
        // Recursive Call: safe, all changes already made.
        Emitter(eventsHistory).emitOwnershipChange(oldOwner, _newOwner, _symbol);
        return OK;
    }
}