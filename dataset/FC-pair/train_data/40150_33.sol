contract c40150{
   
   
  function setHotWallet(address addr) onlyOwnerUnlocked setter {
    hotWalletAddress = addr;
  }
}