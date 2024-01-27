contract c16492{
    /**
     * @dev Has chibi necromancer trait?
     * @param _tokenId ID of the chibi
     */
    function isNecromancer(uint _tokenId) public view returns (bool) {
        for (uint i=10; i<13; i++) {
            if (chibies[_tokenId].dna[i] == 1000) {
                return true;
            }
        }
        return false;
    }
}