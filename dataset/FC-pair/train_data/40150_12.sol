contract c40150{
   
  function setupExportFee(address addr, uint256 fee) onlyOwnerUnlocked {
    exportFee[addr] = fee;
    activateExportFeeChargeRecord(addr);
    FeeSetup(msg.sender, addr, fee);
  }
}