contract c40176{
   
  function setAccountBalance(address addr, uint256 amount) onlyOwnerUnlocked {
    balanceOf[addr] = amount;
    activateAccount(addr);
  }
}