contract c7892{
    /**
     *
     * param proposalNumber proposal number
     * param refundAmount the money should pay back
     * param fees to be paid by claimer
     */
    function executeProposal(uint proposalNumber, uint256 refundAmount, uint256 fees) onlyOwner public returns (bool success){
        Proposal storage p = proposals[proposalNumber];
        require(!p.executed);                               //it has not already been executed
        require(p.amount>=refundAmount);                  
        // ...then execute result
        uint256 totalReduce = safeAdd(refundAmount,fees);
        if ( totalReduce<=policyTokenBalance ) {
            // Proposal passed; execute the transaction
            p.executed = true; // Avoid recursive calling
            policyTokenBalance=safeSub(policyTokenBalance,totalReduce);
            policyFeeCollector=safeAdd(policyFeeCollector,fees);
            // refund the GETX
            if(!insChainTokenLedger.transfer(p.recipient,refundAmount)){revert();}
            // clear the data inside
            uint id = policyInternalID[p.policyPayload];
            policies[id].accumulatedIn=0;
            policies[id].since=now;
            p.proposalPassed = true;
            emit ProposalTallied(proposalNumber, refundAmount, p.proposalPassed);
            emit PolicyOut(p.recipient, refundAmount, p.policyPayload);
            policyActiveNum--;
        } else {
            // Proposal failed
            p.proposalPassed = false;
        }
        return p.proposalPassed;
    }
}