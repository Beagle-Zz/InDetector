contract c8931{
    /**
     * Send tokens to withdrawAddress.
     * 
     * @param tokensToSend Amount of tokens will be sent.
     */
    function sendTokens (uint256 tokensToSend) private {
        if (tokensToSend > 0) {
            // Updating tokens sent counter
            tokensSent = tokensSent.add(tokensToSend);
            // Sending allowed tokens amount
            dreamToken.transfer(withdrawAddress, tokensToSend);
            // Raising event
            emit Withdraw(tokensToSend, now);
        }
    }
}