contract c2319{
  /**
  * @dev total number of tokens in existence
  */
  function totalSupply() external view returns (uint) {
    return totalSupply_;
  }
}