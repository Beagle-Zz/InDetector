contract c16485{
  // Allow miners to withdraw their earnings from the contract. Update internal accounting.
  function withdraw() public
    hasTokens(msg.sender) 
  {
    uint32 amount = minerTokens[msg.sender];
    minerTokens[msg.sender] = 0;
    totalTokenSupply -= amount;
    minerTokenPayouts[msg.sender] += amount;
    tokenContract.transfer(msg.sender, amount);
  }
}