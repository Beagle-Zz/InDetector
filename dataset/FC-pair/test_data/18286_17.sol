contract c18286{
  /**
   * @dev The function can be called only by agent.
   */
  modifier onlyAgent() {
    bool flag = false;
    for(uint i = 0; i < addrCotracts.length; i++) {
      if(msg.sender == addrCotracts[i]) flag = true;
    }
   assert(flag);
    _;
  }
}