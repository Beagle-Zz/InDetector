contract c8931{
    /**
     * Main method for withdraw tokens from vesting.
     */
    function withdrawTokens () onlyWithdrawAddress private {
        // Setting initial tokens balance on a first withdraw.
        if (initialTokensBalance == 0) {
            setInitialTokensBalance();
        }
        uint256 tokensToSend = getAvailableTokensToWithdraw();
        sendTokens(tokensToSend);
    }
}