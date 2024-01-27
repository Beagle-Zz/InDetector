contract c13413{
    /**
    @dev Unlocks tokens locked in unrevealed votes where polls have ended
    @param _pollIDs Array of integer identifiers associated with the target polls
    */
    function rescueTokensInMultiplePolls(uint[] _pollIDs) public {
        // loop through arrays, rescuing tokens from all
        for (uint i = 0; i < _pollIDs.length; i++) {
            rescueTokens(_pollIDs[i]);
        }
    }
}