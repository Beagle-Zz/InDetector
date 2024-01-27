contract c18067{
  /**
   * @notice Get the block the auction ends on
   * @return The block the auction ends on
   */
    function getAuctionEnd() external view returns (uint) {
        return _auctionEnd;
    }
}