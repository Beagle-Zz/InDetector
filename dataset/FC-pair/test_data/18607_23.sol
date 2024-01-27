contract c18607{
  // Should only be done from another contract.
  // To ensure that the LockingContract can release all noted tokens later,
  // one should mint/transfer tokens to the LockingContract's account prior to noting
  function noteTokens(address _beneficiary, uint256 _tokenAmount) external onlyOwner onlyWhenLocked {
    uint256 tokenBalance = tokenContract.balanceOf(this);
    require(tokenBalance == totalTokens.add(_tokenAmount));
    tokens[_beneficiary] = tokens[_beneficiary].add(_tokenAmount);
    totalTokens = totalTokens.add(_tokenAmount);
    NotedTokens(_beneficiary, _tokenAmount);
  }
}