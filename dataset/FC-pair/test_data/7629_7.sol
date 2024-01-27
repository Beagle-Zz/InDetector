contract c7629{
// returns one rootHash which is stored at a specific _index position
function getOneByOneRootHash(uint _index) constant public returns (bytes32 _rootHash )
{
  require( _index <= (getTotalQtyIpfsAddresses()-1) ) ; 
  return ipfsAddressesAcct[_index] ; 
}
}