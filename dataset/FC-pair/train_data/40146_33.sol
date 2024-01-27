contract c40146{
   
   
  function setHotWallet(address addr) onlyOwnerUnlocked setter {
    hotWalletAddress = addr;
  }
}