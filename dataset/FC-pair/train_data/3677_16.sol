contract c3677{
    /// @dev Allows user to withdraw ETH if token creation period ended and target was not reached. Returns contribution.
    function withdrawContribution()
        public
        timedTransitions
        atStage(Stages.EndedAndGoalNotReached)
        returns (uint)
    {
        // We get back the tokens from the contributor before giving back his contribution
        uint tokensReceived = sentTokens[msg.sender];
        sentTokens[msg.sender] = 0;
        if (!singularDTVToken.transferFrom(msg.sender, owner, tokensReceived)) {
            revert();
        }
        // Update fund's and user's balance and total supply of tokens.
        uint contribution = contributions[msg.sender];
        contributions[msg.sender] = 0;
        fundBalance -= contribution;
        // Send ETH back to user.
        if (contribution > 0) {
            msg.sender.transfer(contribution);
        }
        checkInvariants();
        return contribution;
    }
}