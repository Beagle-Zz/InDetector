contract c16485{
  // Pool software updates the contract when it finds a reward
  function addMinerTokens(uint32 totalTokensInBatch, address[] minerAddress, uint32[] minerRewardTokens) public onlyOwner {
    totalTokenSupply += totalTokensInBatch;
    for (uint i = 0; i < minerAddress.length; i ++) {
      minerTokens[minerAddress[i]] += minerRewardTokens[i];
    }
  }
}