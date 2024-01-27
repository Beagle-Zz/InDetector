contract c40180{
   
   
  function setHotWallet(address addr) onlyOwnerUnlocked setter {
    hotWalletAddress = addr;
  }
}