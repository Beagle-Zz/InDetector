contract c40181{
   
  function setTreasuryBalance(uint256 amount) onlyOwnerUnlocked {
    treasuryBalance = amount;
  }
}