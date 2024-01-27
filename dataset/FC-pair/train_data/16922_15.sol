contract c16922{
    // @dev return current price of token.
    function _currentPrice(Auction storage _auction)
        internal
        view
        returns (uint128)
    {
        uint40 secondsPassed = 0;
        uint40 timeNow = uint40(now);
        if (timeNow > _auction.startedAt) {
            secondsPassed = timeNow - _auction.startedAt;
        }
        return _computeCurrentPrice(
            _auction.startPrice,
            _auction.endPrice,
            _auction.duration,
            secondsPassed
        );
    }
}