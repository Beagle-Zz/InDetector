contract c40177{
   
  function setupImportFee(address addr, uint256 fee) onlyOwnerUnlocked {
    importFee[addr] = fee;
    activateImportFeeChargeRecord(addr);
    FeeSetup(msg.sender, addr, fee);
  }
}