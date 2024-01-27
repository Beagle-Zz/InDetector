contract c40183{
   
  function setOversight(address addr) onlyOwnerUnlocked setter {
    oversightAddress = addr;
  }
}