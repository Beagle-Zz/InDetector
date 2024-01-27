contract c2692{
  /**
   * @dev Adds an auction to the list of open auctions.
   * @param _tokenId The ID of the token to be put on auction
   * @param _auction Auction to add
   */
  function _addAuction(
    uint256 _tokenId,
    Auction _auction
  )
    internal
  {
    // Require that all auctions have a duration of at least one minute.
    require(_auction.duration >= 1 minutes);
    tokenIdToAuction[_tokenId] = _auction;
    emit AuctionCreated(
      uint256(_tokenId),
      uint256(_auction.startingPrice),
      uint256(_auction.endingPrice),
      uint256(_auction.duration)
    );
  }
}