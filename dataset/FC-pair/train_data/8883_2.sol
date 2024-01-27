contract c8883{
    /********************************* */
    // karma functions
    function viewCoinsKarma(uint _coinsKarmaId) view public returns (uint, string, string, uint, uint, bool) {
        CoinsKarma storage coinskarma = coinkarma[_coinsKarmaId];
        return (_coinsKarmaId, coinskarma.name, coinskarma.symbol, coinskarma.totalKarmaUp, coinskarma.totalKarmaDown, coinskarma.exists);
    }
}