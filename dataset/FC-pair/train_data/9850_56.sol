contract c9850{
    /**
    @dev                 Called by a voter to claim their rewards for each completed vote. Someone
                         must call updateStatus() before this can be called.
    @param _challengeIDs The PLCR pollIDs of the challenges rewards are being claimed for
    @param _salts        The salts of a voter's commit hashes in the given polls
    */
    function claimRewards(uint[] _challengeIDs, uint[] _salts) public {
        // make sure the array lengths are the same
        require(_challengeIDs.length == _salts.length);
        // loop through arrays, claiming each individual vote reward
        for (uint i = 0; i < _challengeIDs.length; i++) {
            claimReward(_challengeIDs[i], _salts[i]);
        }
    }
}