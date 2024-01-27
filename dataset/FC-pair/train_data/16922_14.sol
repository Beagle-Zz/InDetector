contract c16922{
    // @dev calculate current price of auction. 
    //  When testing, make this function public and turn on
    //  `Current price calculation` test suite.
    function _computeCurrentPrice(
        uint128 _startPrice,
        uint128 _endPrice,
        uint40 _duration,
        uint40 _secondsPassed
    )
        internal
        pure
        returns (uint128)
    {
        if (_secondsPassed >= _duration) {
            return _endPrice;
        } else {
            int256 totalPriceChange = int256(_endPrice) - int256(_startPrice);
            int256 currentPriceChange = totalPriceChange * int256(_secondsPassed) / int256(_duration);
            uint128 currentPrice = _startPrice + uint128(currentPriceChange);
            return currentPrice;
        }
    }
}