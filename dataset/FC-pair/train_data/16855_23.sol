contract c16855{
    /**
     * Sets the exchange rate from ETH to token.
     *
     * @param n Numerator for ethRate
     * @param d Denominator for ethRate
     */
    function setETHRate(uint256 n, uint256 d) external onlyRole(ROLE_ORACLE) {
        ethRate = R.Rational(n, d);
        emit RateUpdatedETH(n, d);
    }
}