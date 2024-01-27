contract c40182{
   
  function setExportFee(address addr, uint256 fee) multisig(sha3(msg.data)) {
    uint256 max = 1;
    max = pow10(1, decimals);
    assert(fee <= max);
    exportFee[addr] = fee;
    activateExportFeeChargeRecord(addr);
  }
}