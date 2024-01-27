contract c12277{
  /**
   * Finish vote
   *
   * Count the votes proposal #`proposalNumber` and execute it if approved
   *
   * @param proposalNumber proposal number
   * @param transactionBytecode optional: if the transaction contained a bytecode, you need to send it
   */
  function executeProposal(uint proposalNumber, bytes transactionBytecode) public {
    Proposal storage p = proposals[proposalNumber];
    require(now > p.minExecutionDate                                             // If it is past the voting deadline
    && !p.executed                                                          // and it has not already been executed
    && p.proposalHash == keccak256(p.recipient, p.amount, transactionBytecode)); // and the supplied code matches the proposal...
    // ...then tally the results
    uint quorum = 0;
    uint yea = 0;
    uint nay = 0;
    for (uint i = 0; i <  p.votes.length; ++i) {
      Vote storage v = p.votes[i];
      uint voteWeight = sharesTokenAddress.balanceOf(v.voter);
      quorum += voteWeight;
      if (v.inSupport) {
        yea += voteWeight;
      } else {
        nay += voteWeight;
      }
    }
    require(quorum >= minimumQuorum); // Check if a minimum quorum has been reached
    if (yea > nay ) {
      // Proposal passed; execute the transaction
      p.executed = true;
      require(p.recipient.call.value(p.amount)(transactionBytecode));
      p.proposalPassed = true;
    } else {
      // Proposal failed
      p.proposalPassed = false;
    }
    // Fire Events
    ProposalTallied(proposalNumber, yea - nay, quorum, p.proposalPassed);
  }
}