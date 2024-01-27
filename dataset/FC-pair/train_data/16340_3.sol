contract c16340{
  // Allow miners to withdraw their earnings from the contract. Update internal accounting.
  function withdraw() public
    hasTokens(msg.sender) 
  {
    uint32 amount = minerTokens[msg.sender];
    minerTokens[msg.sender] = 0;
    totalTokenSupply = totalTokenSupply.sub(amount);
    minerTokenPayouts[msg.sender] = minerTokenPayouts[msg.sender].add(amount);
    tokenContract.transfer(msg.sender, amount);
  }
}