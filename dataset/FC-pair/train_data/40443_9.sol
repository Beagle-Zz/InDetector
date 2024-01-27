contract c40443{
   
  function whitelistRemove(address addr) public isOnWhitelist {
     
    if (msg.sender != addr) {
      throw;
    }
     
    LogWhitelistRemove(msg.sender, now);
     
    whitelist[msg.sender] = false;
  }
}