contract c16197{
    /// Returns the total tokens which can be purchased right now.
    function tokensAvailable()
        public
        constant
        when_active
        only_in_phase_1
        returns (uint256 tokens)
    {
        uint256 _currentCap = totalAccounted.div(currentPrice());
        if (_currentCap >= tokenCapPhaseOne) {
            return 0;
        }
        return tokenCapPhaseOne.sub(_currentCap);
    }
}