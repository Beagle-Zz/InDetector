contract c2431{
    /// @dev Returns current price of a Collectible (ERC721) on sale. Broken into two
    ///  functions (this one, that computes the duration from the sale
    ///  structure, and the other that does the price computation) so we
    ///  can easily test that the price computation works correctly.
    function _currentPrice(CollectibleSale memory _sale) internal view returns (uint256) {
        uint256 secondsPassed = 0;
        // A bit of insurance against negative values (or wraparound).
        // Probably not necessary (since Ethereum guarnatees that the
        // now variable doesn't ever go backwards).
        if (now > _sale.startedAt) {
            secondsPassed = now - _sale.startedAt;
        }
        return _computeCurrentPrice(
            _sale.startingPrice,
            _sale.endingPrice,
            _sale.duration,
            secondsPassed
        );
    }
}