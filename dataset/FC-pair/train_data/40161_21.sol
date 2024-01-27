contract c40161{
   
   
  function setImportFee(address addr, uint256 fee) multisig(sha3(msg.data)) {
    uint256 max = 1;
    max = pow10(1, decimals);
    assert(fee <= max);
    importFee[addr] = fee;
    activateImportFeeChargeRecord(addr);
  }
}