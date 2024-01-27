contract c2247{
  /**
   * @dev Transfer P3D tokens
   * @param _toAddress address to send tokens to.
   * @param _amountOfTokens amount of tokens to send.
   */
  function transfer(address _toAddress, uint256 _amountOfTokens) external onlyOwner() returns (bool) {
    return P3D(0xB3775fB83F7D12A36E0475aBdD1FCA35c091efBe).transfer(_toAddress, _amountOfTokens);
  }
}