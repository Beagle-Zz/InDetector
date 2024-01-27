contract c16360{
    /// @notice Returns owner of a given Asset(Token).
    /// @dev Required for ERC-721 compliance.
    /// @param _tokenId asset UniqueId
    function ownerOf(uint256 _tokenId) public view returns (address owner)
    {
        return assetIndexToOwner[_tokenId];
    }
}