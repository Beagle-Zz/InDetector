contract c16360{
    /// @notice Check if asset has all attributes passed by parameter
    /// @param _tokenId The UniqueId of the asset of interest.
    /// @param _attributes see Asset Struct description
    function hasAllAttrs(uint256 _tokenId, bytes2 _attributes) public view returns (bool) {
        return assets[_tokenId].attributes & _attributes == _attributes;
    }
}