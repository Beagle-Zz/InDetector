contract c3557{
    /**
     * Function for tokens withdrawal from the vesting smart contract. Triggered from the fallback function.
     */
    function withdrawTokens () private whenInitialized {
        uint256 tokensToSend = getAvailableTokensToWithdraw();
        sendTokens(tokensToSend);
        if (dreamToken.balanceOf(this) == 0) { // When all tokens were sent, destroy this smart contract
            selfdestruct(withdrawalAddress);
        }
    }
}