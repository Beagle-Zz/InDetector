contract c9850{
    // ----------------
    // PRIVATE FUNCTIONS
    // ----------------
    /**
    @dev resolves a challenge for the provided _propID. It must be checked in advance whether the _propID has a challenge on it
    @param _propID the proposal ID whose challenge is to be resolved.
    */
    function resolveChallenge(bytes32 _propID) private {
        ParamProposal memory prop = proposals[_propID];
        Challenge storage challenge = challenges[prop.challengeID];
        // winner gets back their full staked deposit, and dispensationPct*loser's stake
        uint reward = challengeWinnerReward(prop.challengeID);
        challenge.winningTokens = voting.getTotalNumberOfTokensForWinningOption(prop.challengeID);
        challenge.resolved = true;
        if (voting.isPassed(prop.challengeID)) { // The challenge failed
            if(prop.processBy > now) {
                set(prop.name, prop.value);
            }
            emit _ChallengeFailed(_propID, prop.challengeID, challenge.rewardPool, challenge.winningTokens);
            require(token.transfer(prop.owner, reward));
        }
        else { // The challenge succeeded or nobody voted
            emit _ChallengeSucceeded(_propID, prop.challengeID, challenge.rewardPool, challenge.winningTokens);
            require(token.transfer(challenges[prop.challengeID].challenger, reward));
        }
    }
}