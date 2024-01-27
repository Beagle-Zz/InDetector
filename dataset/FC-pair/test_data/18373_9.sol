contract c18373{
    /// @dev Calculate exchange
    function buyPriceAt(uint256 _time) internal constant returns(uint256) {
        if (_time >= startTimeRoundOne && _time <= stopTimeRoundOne) {
            return exchangeRateRoundOne;
        }  else {
            return 0;
        }
    }
}