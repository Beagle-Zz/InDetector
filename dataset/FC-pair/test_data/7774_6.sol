contract c7774{
  // ETH Owner refund money
  // BTC Owner gets -1 reputation
  function refund(address _participantAddress) public {
    Swap memory swap = swaps[msg.sender][_participantAddress];
    require(swap.balance > uint256(0));
    require(swap.createdAt.add(SafeTime) < now);
    msg.sender.transfer(swap.balance);
    // TODO it looks like ETH Owner can create as many swaps as possible and refund them to decrease someone reputation
    Reputation(ratingContractAddress).change(_participantAddress, -1);
    clean(msg.sender, _participantAddress);
    Refund();
  }
}