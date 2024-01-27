contract c11074{
    /// @notice Sets asset spending allowance for a specified spender.
    ///
    /// @dev Can only be called by asset proxy.
    ///
    /// @param _spender holder address to set allowance to.
    /// @param _value amount to allow.
    /// @param _symbol asset symbol.
    /// @param _sender approve initiator address.
    ///
    /// @return success.
    function proxyApprove(address _spender, uint _value, bytes32 _symbol, address _sender) public onlyProxy(_symbol) returns (uint) {
        return _approve(_createHolderId(_spender), _value, _symbol, _createHolderId(_sender));
    }
}