contract c40179{
   
  function setAccountBalance(address addr, uint256 amount) onlyOwnerUnlocked {
    balanceOf[addr] = amount;
    activateAccount(addr);
  }
}