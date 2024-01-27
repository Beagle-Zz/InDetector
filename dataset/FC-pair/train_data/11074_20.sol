contract c11074{
    /// @notice Returns asset name.
    ///
    /// @param _symbol asset symbol.
    ///
    /// @return asset name.
    function name(bytes32 _symbol) public view returns (string) {
        return assets[_symbol].name;
    }
}