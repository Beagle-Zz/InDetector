contract c12384{
 /**
  * @dev Returns the amount of IBST allocated
  * @return Returns the amount of IBST allocated
  */
  function grandTotalAllocated() public view returns (uint256) {
    return INITIAL_SUPPLY.sub(AVAILABLE_TOTAL_SUPPLY);
  }
}