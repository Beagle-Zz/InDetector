contract c12700{
    /// @notice Admins are able to approve proposal that someone submitted
    /// @param tokens the list of tokens in consideration during this period
    function startTokenVotes(address[15] tokens) public onlyAdmins {
        uint _proposalId = tokenBatches.length;
        if(_proposalId > 0) {
          TokenProposal memory op = tokenBatches[_proposalId - 1];
          DestructibleMiniMeToken(op.votingToken).recycle();
        }
        tokenBatches.length++;
        TokenProposal storage p = tokenBatches[_proposalId];
        p.duration = VOTING_DURATION * (1 days);
        p.consideredTokens = tokens;
        p.votingToken = tokenFactory.createDestructibleCloneToken(
                nectarToken,
                getBlockNumber(),
                appendUintToString("EfxTokenVotes-", _proposalId),
                MiniMeToken(nectarToken).decimals(),
                appendUintToString("EfxTokenVotes-", _proposalId),
                true);
        p.startTime = now;
        p.startBlock = getBlockNumber();
        emit NewTokens(_proposalId);
    }
}