contract c14893{
    // Return the less of settings.maxBet and curMaxBet()
    function effectiveMaxBet() public view returns (uint _amount) {
        uint _curMax = curMaxBet();
        return _curMax > settings.maxBet ? settings.maxBet : _curMax;
    }
}