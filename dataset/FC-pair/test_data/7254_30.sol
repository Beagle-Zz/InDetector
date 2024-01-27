contract c7254{
    // @dev Adds bonus tokens by token supply bought by user
    // @param _totalSupply total supply of token bought during pre-sale/crowdsale
    // @param _newTokens tokens currently bought by user
    function addBonusTokens(uint256 _totalSupply, uint256 _newTokens) internal view returns (uint256) {
        uint returnTokens;
        uint tokens = _newTokens;
        returnTokens = tokens.add(tokens.mul(BONUS_PERCENTAGE).div(100));
        return returnTokens;
    }
}