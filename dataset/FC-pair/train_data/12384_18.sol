contract c12384{
 /**
  * @dev Returns remaining Company allocation
  * @return Returns remaining Company allocation
  */
 function companyRemainingAllocation() public view returns (uint256) {
   return allocations[companyWallet].totalAllocated.sub(allocations[companyWallet].amountClaimed);
 }
}