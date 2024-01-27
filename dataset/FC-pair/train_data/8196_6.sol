contract c8196{
    /**
     * @dev Tracks a reverse stock split
     * @param _marketIndex The index of the market
     * @param _symbol A stock symbol
     * @param _divisor Number of existing shares that will equal 1 new share
     * @param _price The current stock price. Remainder shares will sold at this price
     */
    function reverseSplit
    (
        uint8 _marketIndex,
        bytes6 _symbol,
        uint8 _divisor,
        uint32 _price
    )
        external
        onlyOwner
    {
        bytes6 market = markets[_marketIndex];
        bytes12 stockKey = getStockKey(market, _symbol);
        Position storage position = positions[stockKey];
        require(position.quantity > 0);
        uint32 quantity = position.quantity / _divisor;
        uint32 extraQuantity = position.quantity - (quantity * _divisor);
        if (extraQuantity > 0) {
            _sell(_marketIndex, _symbol, extraQuantity, _price);
        }
        position.avgPrice = position.avgPrice * _divisor;
        position.quantity = quantity;
        emit ReverseSplit(market, _symbol, _divisor, now);
    }
}