contract c16407{
    /**
    * @dev Return the infoUrl of Chibi
    * @param _tokenId infoUrl of _tokenId
    **/
    function tokenMetadata(uint256 _tokenId) constant public returns (string infoUrl) {
        return chibies[_tokenId].infoUrl;
    }
}