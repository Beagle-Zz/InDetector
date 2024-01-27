contract c18051{
    /// @notice Returns the address currently assigned ownership of a given Artwork.
    /// @dev Required for ERC-721 compliance.
    function ownerOf(uint256 _tokenId) external view returns (address owner) {
        owner = artworkIndexToOwner[_tokenId];
        require(owner != address(0));
    }
}