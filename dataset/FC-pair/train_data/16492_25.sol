contract c16492{
    // exhaust after battle
    function exhaustBattle(uint _tokenId) internal view returns (uint) {
        uint _exhaust = 0;
        for (uint i=10; i<13; i++) {
            if (chibies[_tokenId].dna[i] == 1) {
                _exhaust += (exhaustionTime * 3);
            }
            if (chibies[_tokenId].dna[i] == 3) {
                _exhaust += exhaustionTime.div(2);
            }
        }
        _exhaust = geneContract.exhaustAfterBattle(chibies[_tokenId].gen, _exhaust);
        return _exhaust;
    }
}