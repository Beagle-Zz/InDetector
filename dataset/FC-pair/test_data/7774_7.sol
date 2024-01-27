contract c7774{
  // BTC Owner closes Swap
  // If ETH Owner don't create swap after init in in safeTime
  // ETH Owner -1 reputation
  function abort(address _ownerAddress) public {
    require(swaps[_ownerAddress][msg.sender].balance == uint256(0));
    require(participantSigns[_ownerAddress][msg.sender] != uint(0));
    require(participantSigns[_ownerAddress][msg.sender].add(SafeTime) < now);
    Reputation(ratingContractAddress).change(_ownerAddress, -1);
    clean(_ownerAddress, msg.sender);
    Abort();
  }
}