contract c2977{
  /**
  * Returns the total Led token supply at the current block
  * @return total supply {uint256}
  */
  function totalSupply() public constant returns (uint256) {
    return totalSupplyAt(block.number);
  }
}