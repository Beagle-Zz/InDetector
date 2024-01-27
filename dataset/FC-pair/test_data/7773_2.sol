contract c7773{
  // ETH Owner creates Swap with secretHash
  // ETH Owner make token deposit
  function createSwap(bytes20 _secretHash, address _participantAddress) public payable {
    require(msg.value > 0);
    require(participantSigns[msg.sender][_participantAddress].add(SafeTime) > now);
    require(swaps[msg.sender][_participantAddress].balance == uint256(0));
    swaps[msg.sender][_participantAddress] = Swap(
      bytes32(0),
      _secretHash,
      now,
      msg.value
    );
    CreateSwap(now);
  }
}