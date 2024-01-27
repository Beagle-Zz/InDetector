contract c40147{
   
   
  function setHotWallet(address addr) onlyOwnerUnlocked setter {
    hotWalletAddress = addr;
  }
}