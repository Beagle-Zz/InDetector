contract c40177{
   
  function extractAccountAllowanceRecordLength(address addr) returns (uint256 len) {
    return allowanceIndex[addr].length;
  }
}