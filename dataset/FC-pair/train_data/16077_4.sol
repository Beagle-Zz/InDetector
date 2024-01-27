contract c16077{
    /**
     * @dev switchToNextRound sets the startTime, endTime and tokenCap of the next phase
     * and sets the next phase as current phase.
     */
    function switchToNextRound() public {
        uint256 prevRoundId = currentRoundId;
        uint256 nextRoundId = currentRoundId + 1;
        require(nextRoundId < rounds.length);
        rounds[prevRoundId].endTime = now;
        rounds[nextRoundId].startTime = now + 1;
        rounds[nextRoundId].endTime = now + 30;
        if (nextRoundId == rounds.length - 1) {
            rounds[nextRoundId].tokensCap = tokensCap.sub(tokensIssued);
        } else {
            rounds[nextRoundId].tokensCap = tokensCap.sub(tokensIssued).div(5);
        }
        currentRoundId = nextRoundId;
        emit SwitchedToNextRound(currentRoundId);
    }
}