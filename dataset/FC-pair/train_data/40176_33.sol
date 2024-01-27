contract c40176{
   
   
  function setHotWallet(address addr) onlyOwnerUnlocked setter {
    hotWalletAddress = addr;
  }
}