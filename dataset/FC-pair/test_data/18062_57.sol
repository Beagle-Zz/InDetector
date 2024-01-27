contract c18062{
    /// @dev Computes the next gen0 auction starting price, given
    ///  the average of the past 5 prices + 50%.
    function _computeNextArtworkPrice() internal view returns (uint256) {
        uint256 avePrice = saleAuction.averageArtworkSalePrice();
        // Sanity check to ensure we don't overflow arithmetic
        require(avePrice == uint256(uint128(avePrice)));
        uint256 nextPrice = avePrice + (avePrice / 2);
        // We never auction for less than starting price
        if (nextPrice < ARTWORK_STARTING_PRICE) {
            nextPrice = ARTWORK_STARTING_PRICE;
        }
        return nextPrice;
    }
}