contract c16492{
    /**
    * @dev Triggers a Chibi event getting some additional data
    * @return various
    */
    function queryChibiAdd(uint _tokenId) public view returns (
        address owner,
        bool founder
        ) {
        return (
        chibies[_tokenId].owner,
        chibies[_tokenId].founder
        );
    }
}