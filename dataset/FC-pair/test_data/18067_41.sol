contract c18067{
  /**
   * @notice End the auction, allowing the withdrawal of ether and tokens
   */
    function endAuction() external {
        require(block.number >= _auctionEnd);
        require(!_ended);
        _ended = true;
        AuctionEnded(
            _topBids[0].bidderAddress, _topBids[0].bid,
            _topBids[1].bidderAddress, _topBids[1].bid,
            _topBids[2].bidderAddress, _topBids[2].bid
        );
    }
}