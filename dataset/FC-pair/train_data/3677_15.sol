contract c3677{
    /// @dev Allows user to create tokens if token creation is still going and cap not reached. Returns token count.
    function fund()
        public
        timedTransitions
        atStageOR(Stages.GoingAndGoalNotReached, Stages.GoingAndGoalReached)
        payable
        returns (uint)
    {
        uint tokenCount = (msg.value * (10**18)) / valuePerToken; // Token count in wei is rounded down. Sent ETH should be multiples of valuePerToken.
        require(tokenCount > 0);
        if (tokensSent + tokenCount > CAP) {
            // User wants to create more tokens than available. Set tokens to possible maximum.
            tokenCount = CAP - tokensSent;
        }
        tokensSent += tokenCount;
        uint contribution = (tokenCount * valuePerToken) / (10**18); // Ether spent by user.
        // Send change back to user.
        if (msg.value > contribution && !msg.sender.send(msg.value - contribution)) {
            revert();
        }
        // Update fund and user's balance and total supply of tokens.
        fundBalance += contribution;
        contributions[msg.sender] += contribution;
        sentTokens[msg.sender] += tokenCount;
        if (!singularDTVToken.transfer(msg.sender, tokenCount)) {
            // Tokens could not be issued.
            revert();
        }
        // Update stage
        if (stage == Stages.GoingAndGoalNotReached) {
            if (tokensSent >= TOKEN_TARGET) {
                stage = Stages.GoingAndGoalReached;
            }
        }
        // not an else clause for the edge case that the CAP and TOKEN_TARGET are reached in one call
        if (stage == Stages.GoingAndGoalReached) {
            if (tokensSent == CAP) {
                stage = Stages.EndedAndGoalReached;
            }
        }
        checkInvariants();
        Contributed(msg.sender, contribution, tokenCount);
        return tokenCount;
    }
}