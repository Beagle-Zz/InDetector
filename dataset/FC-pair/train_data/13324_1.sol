contract c13324{
    // low level token purchase function
    function buyTokens(address beneficiary) public payable {
        require(beneficiary != address(0));
        require(validPurchase());
        uint256 weiAmount = msg.value;
        // calculate token amount to be created
        uint256 tokens = getTokenAmount(weiAmount);
        // update state
        weiRaised = weiRaised.add(weiAmount);
        token.mint(beneficiary, tokens);
        emit TokenPurchase(msg.sender, beneficiary, weiAmount, tokens);
        forwardFunds();
    }
}