contract c40178{
   
  function setAsset(address addr) onlyOwnerUnlocked setter {
    assetAddress = addr;
  }
}