contract c40160{
   
  function setAccountFrozenStatus(address addr, bool frozen) onlyOwnerUnlocked {
    activateAccount(addr);
    frozenAccount[addr] = frozen;
  }
}