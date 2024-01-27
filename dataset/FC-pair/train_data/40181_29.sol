contract c40181{
   
  function extractAccountAllowanceRecordLength(address addr) constant returns (uint256 len) {
    return allowanceIndex[addr].length;
  }
}