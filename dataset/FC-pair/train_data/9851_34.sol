contract c9851{
    // --------
    // GETTERS
    // --------
    /**
    @dev                Calculates the provided voter's token reward for the given poll.
    @param _voter       The address of the voter whose reward balance is to be returned
    @param _challengeID The ID of the challenge the voter's reward is being calculated for
    @param _salt        The salt of the voter's commit hash in the given poll
    @return             The uint indicating the voter's reward
    */
    function voterReward(address _voter, uint _challengeID, uint _salt)
    public view returns (uint) {
        uint winningTokens = challenges[_challengeID].winningTokens;
        uint rewardPool = challenges[_challengeID].rewardPool;
        uint voterTokens = voting.getNumPassingTokens(_voter, _challengeID, _salt);
        return (voterTokens * rewardPool) / winningTokens;
    }
}