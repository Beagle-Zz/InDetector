contract c11390{
    // buy ICS tokens
    function _buyIcsTokens(address _beneficiary, uint256 _value) internal {
        uint256 tokensWithBonus = _getTokenNumberWithBonus(_value);
        icsToken.mint(_beneficiary, tokensWithBonus);
        emit IcsTokenPurchase(msg.sender, _beneficiary, tokensWithBonus);
    }
}