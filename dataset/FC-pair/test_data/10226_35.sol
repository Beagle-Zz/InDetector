contract c10226{
  /**
  * @dev increase total number of tokens in existence
  */
  function increaseTotalSupply(uint256 _increase) internal {
    uint256 totalSupply_ = totalSupply();
    totalSupply_ = totalSupply_.add(_increase);
    rocketStorage.setUint(keccak256("token.totalSupply"),totalSupply_);
  }
}