contract c40178{
   
  function setOversight(address addr) onlyOwnerUnlocked setter {
    oversightAddress = addr;
  }
}