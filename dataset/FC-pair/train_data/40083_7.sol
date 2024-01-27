contract c40083{
   
   
  function authCancel(address from) external returns (uint8 status) {
    if (!masterKeys[from] || !trustedClients[msg.sender]) {
      Unauthorized(from);
      return 0;
    }
    uint256 call = functionCalling[from];
    if (call == 0) {
      NothingToCancel(from);
      return 1;
    } else {
      AuthCancel(from, from);
      functionCalling[from] = 0;
      functionCalls[call] = 0x0;
      return 2;
    }
  }
}