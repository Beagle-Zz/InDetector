contract c9850{
    /**
    @notice Reveals vote with choice and secret salt used in generating commitHash to attribute committed tokens
    @param _pollID Integer identifier associated with target poll
    @param _voteOption Vote choice used to generate commitHash for associated poll
    @param _salt Secret number used to generate commitHash for associated poll
    */
    function revealVote(uint _pollID, uint _voteOption, uint _salt) public {
        // Make sure the reveal period is active
        require(revealPeriodActive(_pollID));
        require(pollMap[_pollID].didCommit[msg.sender]);                         // make sure user has committed a vote for this poll
        require(!pollMap[_pollID].didReveal[msg.sender]);                        // prevent user from revealing multiple times
        require(keccak256(_voteOption, _salt) == getCommitHash(msg.sender, _pollID)); // compare resultant hash from inputs to original commitHash
        uint numTokens = getNumTokens(msg.sender, _pollID);
        if (_voteOption == 1) {// apply numTokens to appropriate poll choice
            pollMap[_pollID].votesFor += numTokens;
        } else {
            pollMap[_pollID].votesAgainst += numTokens;
        }
        dllMap[msg.sender].remove(_pollID); // remove the node referring to this vote upon reveal
        pollMap[_pollID].didReveal[msg.sender] = true;
        emit _VoteRevealed(_pollID, numTokens, pollMap[_pollID].votesFor, pollMap[_pollID].votesAgainst, _voteOption, msg.sender);
    }
}