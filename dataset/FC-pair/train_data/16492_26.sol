contract c16492{
    // exhaust after fusion
    function exhaustFusion(uint _tokenId) internal returns (uint) {
        uint _exhaust = 0;
        uint counter = chibies[_tokenId].dna[9];
        // set dna here, that way boni still apply but not infinite fusions possible
        // max value 9999
        if (chibies[_tokenId].dna[9] < 9999) chibies[_tokenId].dna[9]++;
        for (uint i=10; i<13; i++) {
            if (chibies[_tokenId].dna[i] == 2) {
                counter = counter.sub(1);
            }
            if (chibies[_tokenId].dna[i] == 4) {
                counter++;
            }
        }
        _exhaust = geneContract.exhaustAfterFusion(chibies[_tokenId].gen, counter, exhaustionTime);
        return _exhaust;
    }
}