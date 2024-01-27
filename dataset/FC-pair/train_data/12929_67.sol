contract c12929{
    //     uint256 price = _computeNextGen0Price();
    //     saleAuction.createAuction(
    //         _dogId,
    //         price,
    //         price,
    //         GEN0_AUCTION_DURATION,
    //         address(this)
    //     );
    // }
    /// @dev Computes the next gen0 auction starting price, given
    ///  the average of the past 5 prices + 50%.
    function computeNextGen0Price() public view returns (uint256) {
        uint256 avePrice = saleAuction.averageGen0SalePrice();
        // Sanity check to ensure we don't overflow arithmetic
        require(avePrice == uint256(uint128(avePrice)));
        uint256 nextPrice = avePrice + (avePrice / 2);
        // We never auction for less than starting price
        if (nextPrice < GEN0_STARTING_PRICE) {
            nextPrice = GEN0_STARTING_PRICE;
        }
        return nextPrice;
    }
}