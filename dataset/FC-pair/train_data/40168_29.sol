contract c40168{
   
  function extractAccountAllowanceRecordLength(address addr) constant returns (uint256 len) {
    return allowanceIndex[addr].length;
  }
}