contract c40147{
   
  function setAccountFrozenStatus(address addr, bool frozen) onlyOwnerUnlocked {
    activateAccount(addr);
    frozenAccount[addr] = frozen;
  }
}