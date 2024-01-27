contract c40164{
   
   
  function setOversight(address addr) onlyOwnerUnlocked setter {
    oversightAddress = addr;
  }
}