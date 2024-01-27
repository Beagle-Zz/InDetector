contract c18772{
    /// @dev Lets buy you some tokens.
    function buyTokens(address _buyer) public payable {
        // Available only if presale or crowdsale is running.
        require((currentPhase == Phase.PresaleRunning) || (currentPhase == Phase.ICORunning));
        require(_buyer != address(0));
        require(msg.value > 0);
        require(validPurchase());
        uint tokensWouldAddTo = 0;
        uint weiWouldAddTo = 0;
        uint256 weiAmount = msg.value;
        uint newTokens = msg.value.mul(RATE);
        weiWouldAddTo = weiRaised.add(weiAmount);
        require(weiWouldAddTo <= TOKEN_SALE_LIMIT);
        newTokens = addBonusTokens(token.totalSupply(), newTokens);
        tokensWouldAddTo = newTokens.add(token.totalSupply());
        require(tokensWouldAddTo <= TOKENS_FOR_SALE);
        token.mint(_buyer, newTokens);
        TokenPurchase(msg.sender, _buyer, weiAmount, newTokens);
        weiRaised = weiWouldAddTo;
        forwardFunds();
        if (weiRaised == TOKENS_FOR_SALE){
            weiCapReached = true;
        }
    }
}