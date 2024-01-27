contract c40163{
   
   
  function setExpiry(uint256 ts) multisig(sha3(msg.data)) {
    expiry = ts;
  }
}