contract c40179{
   
  function setAccountFrozenStatus(address addr, bool frozen) onlyOwnerUnlocked {
    activateAccount(addr);
    frozenAccount[addr] = frozen;
  }
}