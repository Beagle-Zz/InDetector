contract c4176{
    /**
     * @dev Returns an URI for a given token ID
     * @dev Throws if the token is not owned. May return an empty string.
     * @param _tokenId uint256 ID of the token to query
     */
    function tokenURI(uint256 _tokenId) public view returns (string) {
        require(owned(_tokenId));
        return tokenURIs[_tokenId];
    }
}