contract c8438{
  /*** PRIVATE FUNCTIONS ***/
  // If a bag hasn't been purchased in over $timeout,
  // reset its level back to 0 but retain the existing owner
  function getBagLevel(Bag bag) private view returns (uint256) {
    if (now <= (SafeMath.add(bag.purchasedAt, timeout))) {
      return bag.level;
    } else {
      return 0;
    }
  }
}