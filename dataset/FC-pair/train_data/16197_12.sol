contract c16197{
    /// The current end time of the sale assuming that nobody else buys in.
    function calculateEndTime()
        public
        constant
        when_active
        only_in_phase_1
        returns (uint256)
    {
        uint256 res = (FACTOR.mul(240000).div(DIVISOR.mul(totalAccounted.div(tokenCapPhaseOne)).add(FACTOR.mul(4).div(100)))).add(startTime).sub(4848);
        if (res >= firstPhaseEndTime) {
            return firstPhaseEndTime;
        }
        else {
            return res;
        }
    }
}