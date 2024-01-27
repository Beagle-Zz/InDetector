contract c8196{
    /**
     * @dev Splits a unique key for a stock and returns the market and symbol
     * @param _key Unique stock key
     * @return market Stock market
     * @return symbol Stock symbol
     */
    function recoverStockKey(bytes12 _key) public pure returns(bytes6 market, bytes6 symbol) {
        bytes memory _market = new bytes(6);
        bytes memory _symbol = new bytes(6);
        for (uint i = 0; i < 6; i++) {
            _market[i] = _key[i];
        }
        for (uint j = 0; j < 6; j++) {
            _symbol[j] = _key[j + 6];
        }
        assembly {
            market := mload(add(_market, 32))
            symbol := mload(add(_symbol, 32))
        }
    }
}