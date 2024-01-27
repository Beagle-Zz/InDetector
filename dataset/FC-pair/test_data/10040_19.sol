contract c10040{
  /** We restrict transfer by overriding it */
  function transfer(address to, uint value) public canTransfer(msg.sender) returns (bool success) {
    // Call StandardToken.transfer()
   return super.transfer(to, value);
  }
}