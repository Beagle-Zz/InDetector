contract c18051{
    /// @notice Returns the total number of Artworks currently in existence.
    /// @dev Required for ERC-721 compliance.
    function totalSupply() public view returns (uint) {
        return artworks.length - 1;
    }
}