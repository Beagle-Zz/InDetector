contract c18987{
    /// @notice Returns owner of a given Asset(Token).
    /// @param _tokenId Token ID to get owner.
    /// @dev Required for ERC-721 compliance.
    function ownerOf(uint256 _tokenId)
    external
    view
    returns (address owner)
    {
        owner = ethernautsStorage.ownerOf(_tokenId);
        require(owner != address(0));
    }
}