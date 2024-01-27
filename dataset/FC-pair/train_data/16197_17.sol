contract c16197{
    /// Returns bonus for given amount
    function auctionBonus(uint256 _value)
        public
        constant
        when_active
        only_in_phase_1
        returns (uint256 extra)
    {
        return _value.mul(currentBonus).div(100);
    }
}