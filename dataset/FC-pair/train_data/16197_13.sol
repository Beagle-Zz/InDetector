contract c16197{
    /// The current price for a token
    function currentPrice()
        public
        constant
        when_active
        only_in_phase_1
        returns (uint256 weiPerIndivisibleTokenPart)
    {
        return ((FACTOR.mul(240000).div(now.sub(startTime).add(4848))).sub(FACTOR.mul(4).div(100))).div(DIVISOR);
    }
}