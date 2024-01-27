contract c7629{
// An initiator writes a new proposal in the proposal storage area 
function propose(bytes32 _rootHash, string _ipfsAddress) public onlyInitiators
{
  // proposal should not be present already, i.e timestamp has to be in an uninitialized state, i.e. zero 
  require(proposals[_rootHash].timestamp == 0 ) ;
  // writes the proposal for the _ipfsAddress, timestamp it 'now' and set the qty to zero (i.e. no votes yet)
  address[] memory newVoterAcct = new address[](maxValidators) ; 
  Proposal memory newProposal = Proposal( _ipfsAddress , now, 0, 0, 0, newVoterAcct ) ; 
  proposals[_rootHash] = newProposal ; 
  emit newProposalLogged(msg.sender, _rootHash, _ipfsAddress ) ; 
  rootHashesProposals.push(_rootHash) ; 
  totalProposals++ ; 
}
}