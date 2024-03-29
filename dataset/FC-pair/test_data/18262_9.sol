contract c18262{
    /**
     * @dev Callback is called after crowdsale finalization if soft cap is reached
     */
    function onCrowdsaleEnd() external onlyCrowdsale {
        state = FundState.TeamWithdraw;
        ISimpleCrowdsale crowdsale = ISimpleCrowdsale(crowdsaleAddress);
        firstWithdrawAmount = safeDiv(crowdsale.getSoftCap(), 2);
        lastWithdrawTime = now;
        tap = INITIAL_TAP;
        crowdsaleEndDate = now;
    }
}