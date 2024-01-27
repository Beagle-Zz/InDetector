contract c11074{
    /// @notice Transfers asset balance between holders wallets.
    ///
    /// @dev Can only be called by asset proxy.
    ///
    /// @param _to holder address to give to.
    /// @param _value amount to transfer.
    /// @param _symbol asset symbol.
    /// @param _reference transfer comment to be included in a Transfer event.
    /// @param _sender transfer initiator address.
    ///
    /// @return success.
    function proxyTransferWithReference(address _to, uint _value, bytes32 _symbol, string _reference, address _sender) onlyProxy(_symbol) public returns (uint) {
        return _transfer(getHolderId(_sender), _createHolderId(_to), _value, _symbol, _reference, getHolderId(_sender));
    }
}