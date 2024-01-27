contract c2189{
    // low level token purchase function
    function buyTokens(address beneficiary, uint256 value)
        internal
        onlyAuthorised(beneficiary) 
        whenNotPaused
    {
        uint256 newTokens;
        newTokens = getTokens(value);
        weiRaised = weiRaised.add(value);
        // if we have bridged two tranches....
        if (contributions[beneficiary] == 0) {
            numberOfContributors++;
        }
        contributions[beneficiary] = contributions[beneficiary].add(value);
        tokensRaised = tokensRaised.add(newTokens);
        token.mint(beneficiary,newTokens);
        emit TokenPurchase(beneficiary, value, newTokens);
        multiSig.transfer(value);
    }
}