contract c2692{
  /**
   * @dev Returns auction info for a token on auction.
   * @param _tokenId ID of token on auction
   */
  function getAuction(uint256 _tokenId) external view
  returns
  (
    address seller,
    uint256 startingPrice,
    uint256 endingPrice,
    uint256 duration,
    uint256 startedAt
  ) {
    // Check token on auction
    Auction storage auction = tokenIdToAuction[_tokenId];
    require(_isOnAuction(auction));
    return (
      auction.seller,
      auction.startingPrice,
      auction.endingPrice,
      auction.duration,
      auction.startedAt
    );
  }
}