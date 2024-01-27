contract c40150{
   
   
  function setExpiry(uint256 ts) multisig(sha3(msg.data)) {
    expiry = ts;
  }
}