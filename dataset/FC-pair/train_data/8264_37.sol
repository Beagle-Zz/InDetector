contract c8264{
    /**
     * @dev amount for given wei calculation based on rate modifier percentage.
     * @param _weiAmount Value in wei to be converted into tokens
     * @return Number of tokens that can be purchased with the specified _weiAmount
     */
    function _getTokenAmountForBuyer(uint256 _weiAmount, bool isReferred) internal view returns (uint256) {
        return _weiAmount.mul(rate).mul(getCurrentBuyerRateInPermilles(isReferred)).div(1000);
    }
}