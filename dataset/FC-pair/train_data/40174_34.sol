contract c40174{
   
  function setAsset(address addr) onlyOwnerUnlocked setter {
    assetAddress = addr;
  }
}