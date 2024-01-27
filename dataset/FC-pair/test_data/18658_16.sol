contract c18658{
    /// @notice Returns a URI pointing to a metadata package for this token conforming to
    ///  ERC-721 (https://github.com/ethereum/EIPs/issues/721)
    /// @param _tokenId The ID number of the Pixel whose metadata should be returned.
    function tokenMetadata(uint256 _tokenId) external view returns (string infoUrl) {
        return appendUintToString(metaBaseUrl, _tokenId);
    }
}