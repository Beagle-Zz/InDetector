contract c7629{
// returns, for one proposal 
// identified by a rootHash, the timestamp UNIX epoch time associated with it
function getTimestampProposal(bytes32 _rootHash) constant public returns (uint _timeStamp) 
{
  return proposals[_rootHash].timestamp ; 
}
}