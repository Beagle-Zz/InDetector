contract c8196{
    /**
     * @dev Generates a unique key for a stock by combining the market and symbol
     * @param _market Stock market
     * @param _symbol Stock symbol
     * @return key The key
     */
    function getStockKey(bytes6 _market, bytes6 _symbol) public pure returns(bytes12 key) {
        bytes memory combined = new bytes(12);
        for (uint i = 0; i < 6; i++) {
            combined[i] = _market[i];
        }
        for (uint j = 0; j < 6; j++) {
            combined[j + 6] = _symbol[j];
        }
        assembly {
            key := mload(add(combined, 32))
        }
    }
}