contract c12273{
    /**
     * @dev Calculates buy and sell rates after oracles have received it.
     */
    function calcRates() public {
        require(getState() == State.CALC_RATES);
        uint256 minRate = 2**256 - 1; // Max for UINT256
        uint256 maxRate = 0;
        uint256 validOracles = 0;
        for (uint256 i = 0; i < oracles.length; i++) {
            OracleI oracle = OracleI(oracles[i]);
            uint256 rate = oracle.rate();
            if (oracle.waitQuery()) {
                continue;
            }
            if (isRateValid(rate)) {
                minRate = Math.min256(rate, minRate);
                maxRate = Math.max256(rate, maxRate);
                validOracles++;
            } else {
                InvalidRate(rate, oracles[i]);
            }
        }
        // If valid rates data is insufficient - throw
        if (validOracles < MIN_READY_ORACLES)
            revert();
        buyRate = minRate.mul(FEE_MULTIPLIER * RATE_MULTIPLIER - buyFee * RATE_MULTIPLIER / 100) / FEE_MULTIPLIER / RATE_MULTIPLIER;
        sellRate = maxRate.mul(FEE_MULTIPLIER * RATE_MULTIPLIER + sellFee * RATE_MULTIPLIER / 100) / FEE_MULTIPLIER / RATE_MULTIPLIER;
        calcTime = now;
    }
}