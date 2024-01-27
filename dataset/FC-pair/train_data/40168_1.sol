contract c40168{
   
   
  function setOversight(address addr) onlyOwnerUnlocked setter {
    oversightAddress = addr;
  }
}