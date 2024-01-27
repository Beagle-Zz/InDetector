contract c40161{
   
  function setAsset(address addr) onlyOwnerUnlocked setter {
    assetAddress = addr;
  }
}