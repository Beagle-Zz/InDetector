contract c9992{
    // low level token purchase function
    function buyTokens(address beneficiary, uint256 value)
        internal
        onlyAuthorised(beneficiary) 
        whenNotPaused
    {
        uint256 newTokens;
        uint256 newestTokens;
        uint256 thisPhase = value;
        uint256 nextPhase = 0;
        uint256 refund = 0;
        if (weiRaised.add(value) > currentCap) { // exceeds current tranche?
            thisPhase = currentCap.sub(weiRaised);
            nextPhase = value.sub(thisPhase);
        }
        (newTokens, currentCap) = getTokens(thisPhase);
        weiRaised = weiRaised.add(thisPhase);
        // if we have bridged two tranches....
        if (nextPhase > 0) {
            if (weiRaised.add(nextPhase) <= week3Cap) { // another phase to enter
                weiRaised = weiRaised.add(nextPhase);
                (newestTokens, currentCap) = getTokens(nextPhase);
                newTokens = newTokens.add(newestTokens);
                emit NewCapActivated(currentCap);
            } else { // sale is complete...
                refund = nextPhase;
                nextPhase = 0;
                emit HardcapReached();
            }
        }
        if (contributions[beneficiary] == 0) {
            numberOfContributors++;
        }
        contributions[beneficiary] = contributions[beneficiary].add(thisPhase).add(nextPhase);
        tokensRaised = tokensRaised.add(newTokens);
        token.mint(beneficiary,newTokens);
        emit TokenPurchase(beneficiary, thisPhase.add(nextPhase), newTokens);
        multiSig.transfer(thisPhase.add(nextPhase));
        if (refund > 0) {
            beneficiary.transfer(refund);
        }
    }
}