contract c18866{
    /// For querying owner of token
    /// @param _tokenId The tokenID for owner inquiry
    /// @dev Required for ERC-721 compliance.
    function ownerOf(uint256 _tokenId) public view returns (address owner) {
        owner = cardTokenToOwner[_tokenId];
        require(owner != address(0));
    }
}