contract c18918{
    /// @dev Returns current price of an NFT on auction. 
    function _calcCurrentPrice(Auction storage _auction)
        internal
        view
        returns (uint outPrice)
    {
        int256 duration = _auction.duration;
        int256 price0 = _auction.startingPrice;
        int256 price2 = _auction.endingPrice;
        require(duration > 0);
        int256 secondsPassed = int256(now) - int256(_auction.startedAt);
        require(secondsPassed >= 0);
        if (secondsPassed < _auction.duration) {
            int256 priceChanged = (price2 - price0) * secondsPassed / duration;
            int256 currentPrice = price0 + priceChanged;
            outPrice = uint(currentPrice);
        } else {
            outPrice = _auction.endingPrice;
        }
    }
}