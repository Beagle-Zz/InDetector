contract c40176{
   
  function setAccountFrozenStatus(address addr, bool frozen) onlyOwnerUnlocked {
    activateAccount(addr);
    frozenAccount[addr] = frozen;
  }
}