contract c40150{
   
  function mint(uint256 mintedAmount) multisig(sha3(msg.data)) {
    treasuryBalance += mintedAmount;
    totalSupply += mintedAmount;
  }
}