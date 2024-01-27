contract c8196{
    /**
     * @dev Adds to or creates a series of positions
     * @param _marketIndexes The indexes of the markets
     * @param _symbols Stock symbols
     * @param _quantities Quantities of shares to buy
     * @param _prices Prices per share * 100 ($10.24 = 1024)
     */
    function bulkBuy
    (
        uint8[] _marketIndexes,
        bytes6[] _symbols,
        uint32[] _quantities,
        uint32[] _prices
    )
        external
        onlyOwner
    {
        for (uint i = 0; i < _symbols.length; i++) {
            _buy(_marketIndexes[i], _symbols[i], _quantities[i], _prices[i]);
        }
    }
}