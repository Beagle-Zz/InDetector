contract c18043{
    // Process UFT contribution
    function buyUFT(address contributor) public whenNotPaused checkContribution payable {
        uint256 weiAmount = msg.value;
        uint256 refund = 0;
        uint256 _tierIndex = activeTier;
        uint256 _activeTierCap = tierCap[_tierIndex];
        uint256 _activeFundRaisedTier = activeFundRaisedTier[_tierIndex];
        require(_activeFundRaisedTier < _activeTierCap);
        // Checks Amoount of eth still can contributed to the active Tier
        uint256 tierCapOverSold = _activeTierCap.sub(_activeFundRaisedTier);
        // if contributer amount will oversold the active tier cap, partial
        // purchase will proceed, rest contributer amount will refunded to contributor
        if(tierCapOverSold < weiAmount) {
            weiAmount = tierCapOverSold;
            refund = msg.value.sub(weiAmount);
        }
        // Calculate the amount of tokens the Contributor will receive
        uint256 amountUFT = weiAmount.mul(tierTokens[_tierIndex]);
        // Update status
        fundsRaised = fundsRaised.add(weiAmount);
        activeFundRaisedTier[_tierIndex] = activeFundRaisedTier[_tierIndex].add(weiAmount);
        weiContributedPending[contributor] = weiContributedPending[contributor].add(weiAmount);
        pendingAmountUFT[contributor] = pendingAmountUFT[contributor].add(amountUFT);
        pendingUFT = pendingUFT.add(amountUFT);
        // partial process, refund rest value
        if(refund > 0) {
            msg.sender.transfer(refund);
        }
        emit LogContributionPending(contributor, weiAmount, amountUFT, _tierIndex, now);
    }
}