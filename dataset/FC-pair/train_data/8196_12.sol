contract c8196{
    /**
     * @dev Gets a position
     * @param _stockKey The stock key
     * @return quantity Quantity of shares held
     * @return avgPrice Average price paid for shares
     */
    function getPosition
    (
        bytes12 _stockKey
    )
        public
        view
        returns
        (
            uint32 quantity,
            uint32 avgPrice
        )
    {
        Position storage position = positions[_stockKey];
        quantity = position.quantity;
        avgPrice = position.avgPrice;
    }
}