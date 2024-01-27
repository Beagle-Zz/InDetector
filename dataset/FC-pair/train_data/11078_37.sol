contract c11078{
    /*
     * @dev the validBet modifier does as it's name implies and ensures that a bet
     * is valid before proceeding with any methods called on the contract
     * that would require access to such a bet
     * @param _matchId the uint to check if it points to a valid match.
     * @param _betId the uint to check if it points to a valid bet for a match.
     */
    modifier validBet(uint8 _matchId, uint _betId) {
        // short circuit to save gas
        require(_matchId < uint8(matches.length) && _betId < matches[_matchId].numBets);
        _;
    }
}