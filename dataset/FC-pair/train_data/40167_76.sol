contract c40167{
   
   
  function setTimeWindow(uint256 secs) external multisig(sha3(msg.data)) {
    timeWindow = secs;
  }
}