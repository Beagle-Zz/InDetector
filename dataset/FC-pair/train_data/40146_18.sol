contract c40146{
   
  function mint(uint256 mintedAmount) multisig(sha3(msg.data)) {
    treasuryBalance += mintedAmount;
    totalSupply += mintedAmount;
  }
}