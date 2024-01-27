contract c40174{
   
   
  function setExpiry(uint256 ts) multisig(sha3(msg.data)) {
    expiry = ts;
  }
}