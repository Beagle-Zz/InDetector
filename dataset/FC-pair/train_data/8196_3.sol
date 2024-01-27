contract c8196{
    /**
     * @dev Adds to or creates new position
     * @param _marketIndex The index of the market
     * @param _symbol A stock symbol
     * @param _quantity Quantity of shares to buy
     * @param _price Price per share * 100 ($10.24 = 1024)
     */
    function buy
    (
        uint8 _marketIndex,
        bytes6 _symbol,
        uint32 _quantity,
        uint32 _price
    )
        external
        onlyOwner
    {
        _buy(_marketIndex, _symbol, _quantity, _price);
    }
}