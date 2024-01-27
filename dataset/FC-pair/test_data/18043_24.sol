contract c18043{
    // Validation Update Process
    // After we finished the kyc process, we update each validated contributor and transfer if softCapReached the tokens
    // If the contributor is not validated due failed validation, the contributed wei amount will refundet back to the contributor
    function validationPassed(address contributor) onlyOwner public returns (bool) {
        require(contributor != 0x0);
        uint256 amountFinalized = pendingAmountUFT[contributor];
        pendingAmountUFT[contributor] = 0;
        token.transferFromVault(token, contributor, amountFinalized);
        // Update status
        uint256 _fundsRaisedFinalized = fundsRaisedFinalized.add(weiContributedPending[contributor]);
        fundsRaisedFinalized = _fundsRaisedFinalized;
        concludeUFT = concludeUFT.add(amountFinalized);
        weiContributedConclude[contributor] = weiContributedConclude[contributor].add(weiContributedPending[contributor]);
        emit LogContributionConclude(contributor, weiContributedPending[contributor], amountFinalized, now);
        softCapReached();
        // Amount finalized tokes update status
        return true;
    }
}