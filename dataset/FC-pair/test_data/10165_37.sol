contract c10165{
  /**
   * @return true if the block number is over the block internal.
   */
  function validPurchase() internal view returns (bool) {
    bool withinBlock = recentBlock[msg.sender].add(blockInterval) < block.number;
    return withinBlock && super.validPurchase();
  }
}