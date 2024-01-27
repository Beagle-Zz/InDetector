contract c216{
    /**
        @dev Call to vote on a pending proposal
    */
    function voteOnProposal(bool voteFor) external 
    proposalPending()
    onlyVoters()
    notVoted() {
        //cant vote on expired!
        require((block.timestamp - currentProposal.timestamp) <= proposalLife);
        if(voteFor)
        {
            currentProposal.yay.push(msg.sender);
            //Proposal went through? invoke it
            if( currentProposal.yay.length >= votingThreshold )
            {
                _doProposal();
                proposalInProgress = false;
                //no need to reset cooldown on successful proposal
                return;
            }
        } else {
            currentProposal.nay.push(msg.sender);
            //Proposal failed?
            if( currentProposal.nay.length >= votingThreshold )
            {
                proposalInProgress = false;
                cooldownStart = block.timestamp;
                return;
            }
        }
    }
}