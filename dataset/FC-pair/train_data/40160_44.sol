contract c40160{
   
  function setTreasuryBalance(uint256 amount) onlyOwnerUnlocked {
    treasuryBalance = amount;
  }
}