contract c40160{
   
  function mint(uint256 mintedAmount) multisig(sha3(msg.data)) {
    treasuryBalance += mintedAmount;
    totalSupply += mintedAmount;
  }
}