contract c11074{
    /// @notice Returns asset description.
    ///
    /// @param _symbol asset symbol.
    ///
    /// @return asset description.
    function description(bytes32 _symbol) public view returns (string) {
        return assets[_symbol].description;
    }
}