contract c3545{
    /**
    * @dev Returns an URI for a given token ID
    * @dev Throws if the token ID does not exist
    * @param _tokenId uint256 ID of the token to query
    */
    function tokenURI(uint256 _tokenId) public view returns (string) {
        require(exists(_tokenId));
        return _appendUintToString(tokenUriPrefix, genome[_tokenId]);
    }
}