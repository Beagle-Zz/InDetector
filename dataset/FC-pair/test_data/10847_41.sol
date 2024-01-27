contract c10847{
  /**
   * @dev called by the owner to unpause, returns to normal state
   */
  function auctionUnpause() onlyOwner whenAuctionPaused public {
    auctionPaused = false;
    emit AuctionUnpause();
  }
}