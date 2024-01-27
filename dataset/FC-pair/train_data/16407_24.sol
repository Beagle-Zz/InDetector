contract c16407{
    /**
    * @dev Triggers a Chibi event to get some data of token
    * @return various
    */
    function queryChibi(uint _tokenId) public view returns (
        string nameChibi,
        string infoUrl,
        uint16[13] dna,
        uint256 father,
        uint256 mother,
        uint gen,
        uint adult
        ) {
        return (
        chibies[_tokenId].nameChibi,
        chibies[_tokenId].infoUrl,
        chibies[_tokenId].dna,
        chibies[_tokenId].father,
        chibies[_tokenId].mother,
        chibies[_tokenId].gen,
        chibies[_tokenId].adult
        );
    }
}