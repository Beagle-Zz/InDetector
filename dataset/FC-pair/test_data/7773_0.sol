contract c7773{
  // ETH Owner signs swap
  // initializing time for correct work of close() method
  function sign(address _participantAddress) public {
    require(swaps[msg.sender][_participantAddress].balance == 0);
    participantSigns[msg.sender][_participantAddress] = now;
    Sign();
  }
}