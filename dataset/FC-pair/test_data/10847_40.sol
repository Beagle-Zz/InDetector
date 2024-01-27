contract c10847{
  /**
   * @dev called by the owner to pause, triggers stopped state
   */
  function auctionPause() onlyOwner whenNotAuctionPaused public {
    auctionPaused = true;
    emit AuctionPause();
  }
}