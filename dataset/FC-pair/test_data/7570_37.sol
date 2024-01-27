contract c7570{
    /**
    * @dev Overrides _getTokenAmount function in Crowdsale.
    * Calculates token amount, inclusive of bonus, based on ETH contributed.
    * @param _weiAmount Value in wei to be converted into tokens
    * @return Number of tokens that can be purchased with the specified _weiAmount
    */
    function _getTokenAmount(uint256 _weiAmount) internal view returns (uint256) {
        return _weiAmount.mul(getRate());
    }
}