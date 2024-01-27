contract c10226{
  /**
  * @dev decrease total number of tokens in existence
  */
  function decreaseTotalSupply(uint256 _decrease) internal {
    uint256 totalSupply_ = totalSupply();
    totalSupply_ = totalSupply_.sub(_decrease);
    rocketStorage.setUint(keccak256("token.totalSupply"),totalSupply_);
  }
}