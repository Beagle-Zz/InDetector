contract c12737{
    /// returns the price in gwei instead of wei
    function _computeCurrentPrice(
        uint _startingPrice,
        uint _endingPrice,
        uint _duration,
        uint _secondsPassed
    )
        internal
        constant
        returns (uint)
    {
        uint weis_in_gwei = 1000000000;
        if (_secondsPassed >= _duration) {
            return _endingPrice / weis_in_gwei;
        }
        int256 totalPriceChange = int256(_endingPrice) - int256(_startingPrice);
        int256 currentPriceChange = totalPriceChange * int256(_secondsPassed) / int256(_duration);
        int256 _currentPrice = int256(_startingPrice) + currentPriceChange;
        return uint(_currentPrice) / weis_in_gwei;
    }
}