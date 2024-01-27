contract c13413{
    // =================
    // VOTING INTERFACE:
    // =================
    /**
    @notice Commits vote using hash of choice and secret salt to conceal vote until reveal
    @param _pollID Integer identifier associated with target poll
    @param _secretHash Commit keccak256 hash of voter's choice and salt (tightly packed in this order)
    @param _numTokens The number of tokens to be committed towards the target poll
    @param _prevPollID The ID of the poll that the user has voted the maximum number of tokens in which is still less than or equal to numTokens
    */
    function commitVote(uint _pollID, bytes32 _secretHash, uint _numTokens, uint _prevPollID) public {
        require(commitPeriodActive(_pollID));
        // if msg.sender doesn't have enough voting rights,
        // request for enough voting rights
        if (voteTokenBalance[msg.sender] < _numTokens) {
            uint remainder = _numTokens.sub(voteTokenBalance[msg.sender]);
            requestVotingRights(remainder);
        }
        // make sure msg.sender has enough voting rights
        require(voteTokenBalance[msg.sender] >= _numTokens);
        // prevent user from committing to zero node placeholder
        require(_pollID != 0);
        // prevent user from committing a secretHash of 0
        require(_secretHash != 0);
        // Check if _prevPollID exists in the user's DLL or if _prevPollID is 0
        require(_prevPollID == 0 || dllMap[msg.sender].contains(_prevPollID));
        uint nextPollID = dllMap[msg.sender].getNext(_prevPollID);
        // edge case: in-place update
        if (nextPollID == _pollID) {
            nextPollID = dllMap[msg.sender].getNext(_pollID);
        }
        require(validPosition(_prevPollID, nextPollID, msg.sender, _numTokens));
        dllMap[msg.sender].insert(_prevPollID, _pollID, nextPollID);
        bytes32 UUID = attrUUID(msg.sender, _pollID);
        store.setAttribute(UUID, "numTokens", _numTokens);
        store.setAttribute(UUID, "commitHash", uint(_secretHash));
        pollMap[_pollID].didCommit[msg.sender] = true;
        emit _VoteCommitted(_pollID, _numTokens, msg.sender);
    }
}