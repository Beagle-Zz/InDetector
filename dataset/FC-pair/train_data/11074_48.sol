contract c11074{
    /// @notice Returns asset allowance from one holder to another.
    ///
    /// @param _fromId holder id that allowed spending.
    /// @param _toId holder id that is allowed to spend.
    /// @param _symbol asset symbol.
    ///
    /// @return holder to spender allowance.
    function _allowance(uint _fromId, uint _toId, bytes32 _symbol) internal view returns (uint) {
        return assets[_symbol].wallets[_fromId].allowance[_toId];
    }
}