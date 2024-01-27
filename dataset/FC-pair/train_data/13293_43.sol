contract c13293{
    /**
    * @dev Overridden to adjust the rate including bonus
    * @param _weiAmount Value in wei to be converted into tokens
    * @return Number of tokens that can be purchased with the given _weiAmount
    */
    function _getTokenAmount(uint256 _weiAmount) internal view returns (uint256) {
        uint256 tokenAmount = _weiAmount.mul(getRate());
        return tokenAmount;
    }
}