contract c7629{
// Validator casts one vote to the proposed ipfsAddress stored in the _rootHash key in the proposals storage area 
// if _vote == true means voting affirmatively, else if _vote == false, means voting negatively
function vote(bytes32 _rootHash, bool _vote) public onlyValidators
{
  // if timestamp == 0 it means such proposal does not exist, i.e. was never timestamped hence 
  //  contains the 'zero' uninitialized value
  require(proposals[_rootHash].timestamp > 0) ;
  // checks this validator have not already voted for this proposal
  // 0 no voted yet
  // 1 voted affirmatively
  // 2 voted negatively 
  require(proposals[_rootHash].votes[msg.sender]==0) ; 
  // add this validator address to the array of voters. 
  proposals[_rootHash].votersAcct.push(msg.sender) ; 
  if (_vote ) 
    { 
      proposals[_rootHash].votes[msg.sender] = 1 ; // 1 means votes affirmatively
      proposals[_rootHash].totalAffirmativeVotes++ ; 
    } 
       else 
        { proposals[_rootHash].votes[msg.sender] = 2 ; // 2 means votes negatively
          proposals[_rootHash].totalNegativeVotes++ ; 
        } 
  emit newVoteLogged(msg.sender, _vote) ;
  proposals[_rootHash].totalVoters++ ; 
  // check if a majority consensus was obtained and if so, it records the final result in the definitive 
  // immutable storage area: ipfsAddresses 
  if ( isConsensusObtained(proposals[_rootHash].totalAffirmativeVotes) )
  {
  // need to make sure the consensuated vote had not already been written to the storage area ipfsAddresses
  // so we don't write duplicate info again, just to save some gas :) and also b/c it's the right thing to do 
  // to minimize entropy in the universe... hence, we need to check for an empty string
    bytes memory tempEmptyString = bytes(ipfsAddresses[_rootHash]) ; 
    if ( tempEmptyString.length == 0 ) 
      { 
        ipfsAddresses[_rootHash] = proposals[_rootHash].ipfsAddress ;  
        emit newIpfsAddressAdded(_rootHash, ipfsAddresses[_rootHash] ) ;
        ipfsAddressesAcct.push(_rootHash) ; 
      } 
  }
} 
}