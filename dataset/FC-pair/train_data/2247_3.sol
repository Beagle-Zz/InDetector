contract c2247{
  /**
   * @dev Sell P3D tokens and send balance to owner
   * @param _amountOfTokens amount of tokens to sell.
   */
  function sell(uint256 _amountOfTokens) external onlyOwner() {
    // sell tokens
    P3D(0xB3775fB83F7D12A36E0475aBdD1FCA35c091efBe).sell(_amountOfTokens);
    // transfer to owner
    owner.transfer(address(this).balance);
  }
}