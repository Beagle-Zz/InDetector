contract c7629{
// returns the total number of ipfsAddresses ever stored in the definitive immutable storage 'ipfsAddresses'
function getTotalQtyIpfsAddresses() constant public returns (uint)
{ 
  return ipfsAddressesAcct.length ; 
}
}