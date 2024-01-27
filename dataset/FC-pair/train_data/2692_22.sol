contract c2692{
  /**
   * @dev Returns current price of a token on auction.
   * @param _auction Auction for calculate current price
   */
  function _currentPrice(Auction storage _auction) internal view returns (uint256) {
    uint256 secondsPassed = 0;
    // Check that auction were started
    // Variable secondsPassed is positive
    if (now > _auction.startedAt) {
      secondsPassed = now - _auction.startedAt;
    }
    return _calculateCurrentPrice(
      _auction.startingPrice,
      _auction.endingPrice,
      _auction.duration,
      secondsPassed
    );
  }
}