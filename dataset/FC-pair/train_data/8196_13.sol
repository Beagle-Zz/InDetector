contract c8196{
    /**
     * @dev Gets a postion at the given index
     * @param _index The index of the holding
     * @return market Market name
     * @return stock Stock name
     * @return quantity Quantity of shares held
     * @return avgPrice Average price paid for shares
     */  
    function getPositionFromHolding
    (
        uint _index
    )
        public
        view
        returns
        (
            bytes6 market, 
            bytes6 symbol,
            uint32 quantity,
            uint32 avgPrice
        )
    {
        bytes12 stockKey = holdings[_index];
        (market, symbol) = recoverStockKey(stockKey);
        Position storage position = positions[stockKey];
        quantity = position.quantity;
        avgPrice = position.avgPrice;
    }
}