contract c11078{
     /*
     * @dev Ensures a matchId points to a legitimate match
     * @param _matchId the uint to check if it points to a valid match.
     */
    modifier validMatch(uint8 _matchId) {
        require(_matchId < uint8(matches.length));
        _;
    }
}