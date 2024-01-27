contract c7629{
// obtain, for a given rootHash, the definitive immutable stored _ipfsAddress 
function getIpfsAddress(bytes32 _rootHash) constant public returns (string _ipfsAddress)
{
  return ipfsAddresses[_rootHash] ; 
}
}