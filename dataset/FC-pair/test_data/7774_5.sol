contract c7774{
  // ETH Owner closes swap
  // ETH Owner receive +1 reputation
  function close(address _participantAddress) public {
    require(swaps[msg.sender][_participantAddress].balance == 0);
    Reputation(ratingContractAddress).change(msg.sender, 1);
    clean(msg.sender, _participantAddress);
    Close();
  }
}