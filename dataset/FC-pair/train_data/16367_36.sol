contract c16367{
    // Automatically claim earnings from lastClaimRound through the current round
    modifier autoClaimEarnings() {
        updateDelegatorWithEarnings(msg.sender, roundsManager().currentRound());
        _;
    }
}