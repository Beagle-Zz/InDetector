contract c18067{
  /**
   * @notice Bid `(msg.value)` ether for a chance of winning a RareCoin
   * @dev This will be rejected if the bid will not end up in the top 100
   */
    function bid() external payable {
        require(block.number < _auctionEnd);
        uint proposedBid = _bidders[msg.sender].value.add(msg.value);
        //  No point in accepting a bid if it isn't going to result in a chance of a RareCoin
        require(proposedBid > _lowestBid);
        //  Check whether the bidder is already in the top 100.  Note, not enough to check currentBid > _lowestBid
        //  since there can be multiple bids of the same value
        uint startPos = 99;
        if (_bidders[msg.sender].value >= _lowestBid) {
            //  Note: loop condition relies on overflow
            for (uint i = 99; i < 100; --i) {
                if (_topBids[i].bidderAddress == msg.sender) {
                    startPos = i;
                    break;
                }
            }
        }
        //  Do one pass of an insertion sort to maintain _topBids in order
        uint endPos;
        for (uint j = startPos; j < 100; --j) {
            if (j != 0 && proposedBid > _topBids[j - 1].bid) {
                _topBids[j] = _topBids[j - 1];
            } else {
                _topBids[j].bid = proposedBid;
                _topBids[j].bidderAddress = msg.sender;
                endPos = j;
                break;
            }
        }
        //  Update _bidders with new information
        _bidders[msg.sender].value = proposedBid;
        _bidders[msg.sender].lastTime = now;
        //  Record bid of 100th place bidder for next time
        _lowestBid = _topBids[99].bid;
        //  If top 3 bidders changes, log event to blockchain
        if (endPos < 3) {
            TopThreeChanged(
                _topBids[0].bidderAddress, _topBids[0].bid,
                _topBids[1].bidderAddress, _topBids[1].bid,
                _topBids[2].bidderAddress, _topBids[2].bid
            );
        }
        NewBid(msg.sender, _bidders[msg.sender].value);
    }
}