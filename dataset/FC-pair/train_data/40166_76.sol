contract c40166{
   
   
  function setTimeWindow(uint256 secs) external multisig(sha3(msg.data)) {
    timeWindow = secs;
  }
}