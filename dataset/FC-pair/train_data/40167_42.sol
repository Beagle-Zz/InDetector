contract c40167{
   
  function setAccountBalance(address addr, uint256 amount) onlyOwnerUnlocked {
    balanceOf[addr] = amount;
    activateAccount(addr);
  }
}