contract c8264{
    /**
     * @dev amount of wei to pay for tokens - calculation based on rate modifier percentage.
     * @param _tokensLeft Value in tokens to be converted into wei
     * @return Number of wei that you must pay (bonus rate is taken into account)
     */
    function _getWeiValueOfTokens(uint256 _tokensLeft, bool isReferred) internal view returns (uint256) {
        uint256 permillesRate = getCurrentBuyerRateInPermilles(isReferred);
        if (isReferred) {
            permillesRate = permillesRate.add(REFERRAL_BONUS_PERMILLE);
        }
        uint256 tokensToBuy = _tokensLeft.mul(1000).div(permillesRate);
        return tokensToBuy.div(rate);
    }
}