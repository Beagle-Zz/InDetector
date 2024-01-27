contract c11201{
    /// Withdraw a bid that was overbid.
    function withdraw(uint _auctionId) internal {
        uint amount = highestBidOf[_auctionId];
        address highestManBidder = highestBidderOf[_auctionId];
        if (amount > 0) {
             highestManBidder.transfer(amount * 1 szabo);
            }
    }
}