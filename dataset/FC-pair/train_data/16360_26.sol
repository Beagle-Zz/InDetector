contract c16360{
    /// @notice Check if asset is in the state passed by parameter
    /// @param _tokenId The UniqueId of the asset of interest.
    /// @param _category see AssetCategory in EthernautsBase for possible states
    function isCategory(uint256 _tokenId, uint8 _category) public view returns (bool) {
        return assets[_tokenId].category == _category;
    }
}