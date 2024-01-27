contract c4176{
    /**
     * @dev Internal function to set the token URI for a given token
     * @dev Reverts if the token ID is not owned
     * @param _tokenId uint256 ID of the token to set its URI
     * @param _uri string URI to assign
     */
    function _setTokenURI(uint256 _tokenId, string _uri) internal {
        require(owned(_tokenId));
        tokenURIs[_tokenId] = _uri;
    }
}