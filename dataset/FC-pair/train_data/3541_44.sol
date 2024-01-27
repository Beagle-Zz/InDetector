contract c3541{
    /**
    @notice Gets price of an asset multiplied by ten to the power of assetDecimals
    @dev Asset has been registered
    @param ofAsset Asset for which price should be returned
    @return {
      "price": "Price formatting: mul(exchangePrice, 10 ** decimal), to avoid floating numbers",
      "timestamp": "When the asset's price was updated"
    }
    */
    function getPrice(address ofAsset)
        view
        returns (uint price, uint timestamp)
    {
        Data data = assetsToPrices[ofAsset];
        return (data.price, data.timestamp);
    }
}