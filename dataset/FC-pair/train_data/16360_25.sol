contract c16360{
    /// @notice Check if asset has any attribute passed by parameter
    /// @param _tokenId The UniqueId of the asset of interest.
    /// @param _attributes see Asset Struct description
    function hasAnyAttrs(uint256 _tokenId, bytes2 _attributes) public view returns (bool) {
        return assets[_tokenId].attributes & _attributes != 0x0;
    }
}