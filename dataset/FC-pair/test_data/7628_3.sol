contract c7628{
// obtain, for a given rootHash, the proposed (not definitively voted yet) _ipfsAddress
function getProposedIpfs(bytes32 _rootHash) constant public returns (string _ipfsAddress)
{
  return proposals[_rootHash].ipfsAddress ; 
}
}