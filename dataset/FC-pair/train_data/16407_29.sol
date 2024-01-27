contract c16407{
    /**
     * @dev Split traits between father and mother and leave the random at the _tokenId2
     */
    function traits(uint16[13] memory genes, uint _seed, uint _fatherId, uint _motherId) internal view returns (uint16[13] memory) {
        uint _switch = uint136(keccak256(_seed, block.coinbase, block.timestamp)) % 5;
        if (_switch == 0) {
            genes[10] = chibies[_fatherId].dna[10];
            genes[11] = chibies[_motherId].dna[11];
        }
        if (_switch == 1) {
            genes[10] = chibies[_motherId].dna[10];
            genes[11] = chibies[_fatherId].dna[11];
        }
        if (_switch == 2) {
            genes[10] = chibies[_fatherId].dna[10];
            genes[11] = chibies[_fatherId].dna[11];
        }
        if (_switch == 3) {
            genes[10] = chibies[_motherId].dna[10];
            genes[11] = chibies[_motherId].dna[11];
        }
        return genes;
    }
}