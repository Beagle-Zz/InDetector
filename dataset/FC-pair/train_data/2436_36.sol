contract c2436{
    /**
    * @dev Returns an URI for a given token ID. Only returns the based location, you will have to appending a token ID to this
    * @dev Throws if the token ID does not exist. May return an empty string.
    * @param _tokenId uint256 ID of the token to query
    */
    function tokenURI(uint256 _tokenId) public view returns (string) {
        require(exists(_tokenId));
        return tokenURIBase;
    }
}