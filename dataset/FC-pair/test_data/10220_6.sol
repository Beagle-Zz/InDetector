contract c10220{
  /**
   * check if given address is frozen. Freeze works only if moderator role is active
   */
  function isFrozen(address _addr) constant returns (bool){
      return frozen[_addr];
  }
}