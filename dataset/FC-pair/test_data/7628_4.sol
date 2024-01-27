contract c7628{
// how many voters have voted for a given proposal? 
function howManyVoters(bytes32 _rootHash) constant public returns (uint)
{
  return proposals[_rootHash].totalVoters ; 
}
}