contract c16364{
    /**
     * @dev Check if current round is initialized
     */
    function currentRoundInitialized() public view returns (bool) {
        return lastInitializedRound == currentRound();
    }
}