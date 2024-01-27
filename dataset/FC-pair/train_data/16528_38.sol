contract c16528{
    /** 
     * This function should be called only once only after 
     * successfully finished tokensale. Once - because Wings bridge 
     * will be closed at the end of this function call.
     */
    function sendWingsRewardsOnce() public onlyOwner canBeCalledOnce("sendWingsRewards") {
        require(isFinishedSuccessfully());
        uint256 ethReward = 0;
        uint256 tokenReward = 0;
        (ethReward, tokenReward) = bridge.calculateRewards();
        if (ethReward > 0) {
            bridge.transfer(ethReward);
        }
        if (tokenReward > 0) {
            token.sell(bridge, tokenReward);
        }
        // Close Wings bridge
        closeBridge();
    }
}