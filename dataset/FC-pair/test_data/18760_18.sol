contract c18760{
    // low level token purchase function
    function buyTokensIco(address _beneficiary) internal {
        require(_beneficiary != 0x0);
        // calculate token amount to be created
        uint256 rate = getRateIco();
        uint256 tokens = msg.value.mul(10 ** 18).div(rate);
        // update state
        weiRaised = weiRaised.add(msg.value);
        tokensIssuedIco = tokensIssuedIco.add(tokens);
        token.transfer(_beneficiary, tokens);
        // issue events
        TokenPurchase(msg.sender, _beneficiary, msg.value, tokens);
        //forward eth
        forwardFunds();
    }
}