contract c40168{
   
  function setAccountAllowance(address from, address to, uint256 amount) onlyOwnerUnlocked {
    allowance[from][to] = amount;
    activateAllowanceRecord(from, to);
  }
}