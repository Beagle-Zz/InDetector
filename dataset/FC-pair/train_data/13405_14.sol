contract c13405{
    /// @notice Price of MET at nth minute during initial auction.
    /// @param lastPurchasePrice The price of MET in last transaction
    /// @param numTicks The number of minutes passed since last purchase
    /// @return The resulting price
    function priceAtInitialAuction(uint lastPurchasePrice, uint numTicks) public view returns (uint price) {
        /// Price will decrease linearly every minute by the factor of MULTIPLIER.
        /// If lastPurchasePrice is greater than decrease in price then calculated the price.
        /// Return minimumPrice, if calculated price is less than minimumPrice.
        /// If decrease in price is more than lastPurchasePrice then simply return the minimumPrice.
        if (lastPurchasePrice > MULTIPLIER.mul(numTicks)) {
            price = lastPurchasePrice.sub(MULTIPLIER.mul(numTicks));
        }
        if (price < minimumPrice) {
            price = minimumPrice;
        }
    }
}