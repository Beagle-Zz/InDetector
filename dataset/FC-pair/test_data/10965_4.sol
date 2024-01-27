contract c10965{
  /** The function can be called only by a whitelisted release agent. */
  modifier onlyDistributeAgent() {
    require(distAgents[msg.sender] == true) ;
    _;
  }
}