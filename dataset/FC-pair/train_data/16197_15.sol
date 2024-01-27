contract c16197{
    /// The largest purchase than can be done right now. For informational puproses only
    function maxPurchase()
        public
        constant
        when_active
        only_in_phase_1
        returns (uint256 spend)
    {
        return tokenCapPhaseOne.mul(currentPrice()).sub(totalAccounted);
    }
}