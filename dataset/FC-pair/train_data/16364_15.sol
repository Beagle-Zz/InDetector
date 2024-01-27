contract c16364{
    /**
     * @dev Set round length. Only callable by the controller owner
     * @param _roundLength Round length in blocks
     */
    function setRoundLength(uint256 _roundLength) external onlyControllerOwner {
        // Round length cannot be 0
        require(_roundLength > 0);
        if (roundLength == 0) {
            // If first time initializing roundLength, set roundLength before
            // lastRoundLengthUpdateRound and lastRoundLengthUpdateStartBlock
            roundLength = _roundLength;
            lastRoundLengthUpdateRound = currentRound();
            lastRoundLengthUpdateStartBlock = currentRoundStartBlock();
        } else {
            // If updating roundLength, set roundLength after
            // lastRoundLengthUpdateRound and lastRoundLengthUpdateStartBlock
            lastRoundLengthUpdateRound = currentRound();
            lastRoundLengthUpdateStartBlock = currentRoundStartBlock();
            roundLength = _roundLength;
        }
        ParameterUpdate("roundLength");
    }
}