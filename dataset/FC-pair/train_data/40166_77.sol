contract c40166{
   
  function addOversight(address addr) external multisig(sha3(msg.data)) {
    activateOversightAddress(addr);
    oversightAddresses[addr] = true;
  }
}