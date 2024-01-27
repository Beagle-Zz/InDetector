contract c18658{
    /// @notice Returns the address currently assigned ownership of a given Pixel.
    /// @dev Required for ERC-721 compliance.
    function ownerOf(uint256 _tokenId)
        external
        view
        returns (address owner)
    {
        owner = pixelIndexToOwner[_tokenId];
        require(owner != address(0));
    }
}