contract c8196{
    /**
     * @dev Tracks a stock split
     * @param _marketIndex The index of the market
     * @param _symbol A stock symbol
     * @param _multiple Number of new shares per share created
     */
    function split
    (
        uint8 _marketIndex,
        bytes6 _symbol,
        uint8 _multiple
    )
        external
        onlyOwner
    {
        bytes6 market = markets[_marketIndex];
        bytes12 stockKey = getStockKey(market, _symbol);
        Position storage position = positions[stockKey];
        require(position.quantity > 0);
        uint32 quantity = (_multiple * position.quantity) - position.quantity;
        position.avgPrice = (position.quantity * position.avgPrice) / (position.quantity + quantity);
        position.quantity += quantity;
        emit ForwardSplit(market, _symbol, _multiple, now);
    }
}