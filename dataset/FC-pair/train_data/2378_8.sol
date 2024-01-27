contract c2378{
    // the issue of tokens in period 1 sales
    function sale1(address _investor, uint256 _value) internal {
        uint256 tokens = _value.mul(1e18).div(buyPrice); // 66% 
        uint256 bonusTokens = tokens.mul(10).div(100); // + 10% per stage
        tokens = tokens.add(bonusTokens); // 66 %
        token.transferFromICO(_investor, tokens);
        uint256 tokensReserve = tokens.mul(5).div(22); // 15 %
        token.transferFromICO(reserve, tokensReserve);
        uint256 tokensBoynty = tokens.mul(2).div(33); // 4 %
        token.transferFromICO(bounty, tokensBoynty);
        uint256 tokensPromo = tokens.mul(5).div(22); // 15%
        token.transferFromICO(promouters, tokensPromo);
        weisRaised = weisRaised.add(msg.value);
    }
}