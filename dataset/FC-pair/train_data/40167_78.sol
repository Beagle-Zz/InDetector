contract c40167{
   
  function removeOversight(address addr) external multisig(sha3(msg.data)) {
    oversightAddresses[addr] = false;
  }
}