contract c10267{
    //@notice Get the owner of a country token
    /// For querying owner of token
    /// @param _tokenId The tokenID for owner inquiry
    /// @dev Required for ERC-721 compliance.
    function ownerOf(uint256 _tokenId)
        public
        view
        returns (address)
    {
        address owner = countryIndexToOwner[_tokenId];
        return (owner);
    }
}