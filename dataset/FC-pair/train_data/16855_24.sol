contract c16855{
    /**
     * Sets the exchange rate from ETH to token.
     *
     * @param n Numerator for daiRate
     * @param d Denominator for daiRate
     */
    function setDAIRate(uint256 n, uint256 d) external onlyRole(ROLE_ORACLE) {
        daiRate = R.Rational(n, d);
        emit RateUpdatedDAI(n, d);
    }
}