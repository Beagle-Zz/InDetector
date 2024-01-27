contract c18303{
    // Issue tokens to private investors
    function issueTokensForPrivateInvestor(uint _state) private {
        uint256 price = privateSalePrice;
        issueTokens(price, _state);
    }
}