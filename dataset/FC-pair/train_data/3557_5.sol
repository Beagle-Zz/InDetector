contract c3557{
    /**
     * Send tokens to withdrawalAddress.
     * @param tokensToSend Amount of tokens will be sent.
     */
    function sendTokens (uint256 tokensToSend) private {
        if (tokensToSend == 0) {
            return;
        }
        tokensSent = tokensSent.add(tokensToSend); // Update tokensSent variable to send correct amount later
        dreamToken.transfer(withdrawalAddress, tokensToSend); // Send allowed number of tokens
        emit Withdraw(tokensToSend, now); // Emitting a notification that tokens were withdrawn
    }
}