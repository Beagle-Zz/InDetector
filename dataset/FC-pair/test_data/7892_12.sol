contract c7892{
    /**
     * Add Proposal
     *
     * Propose to send `weiAmount / 1e18` ether to `beneficiary` for `ClaimDescription`. `transactionBytecode ? Contains : Does not contain` code.
     *
     * param payload the policy id
     * param beneficiary who to send the ether to
     * param weiAmount amount of token to send, in wei(18 decimals)
     * param claimDescription Description of claim
     */
    function newProposal(uint256 payload, address beneficiary, uint256 weiAmount,string claimDescription) onlyOwner public returns(uint256 proposalID){
        require(policyTokenBalance>weiAmount);
        proposals.length++;
        proposalID = proposals.length-1;
        Proposal storage p = proposals[proposalID];
        p.policyPayload=payload;
        p.recipient = beneficiary;
        p.amount = weiAmount;
        p.description = claimDescription;
        p.executed = false;
        p.proposalPassed = false;
        emit ProposalAdded(proposalID, p.policyPayload, p.amount, p.description);
        numProposals = proposalID+1;
        return proposalID;
    }
}