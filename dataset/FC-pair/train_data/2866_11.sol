contract c2866{
    // @dev Calculates the price and transfers winnings.
    // Does not transfer token ownership.
    function _bid(uint40 _cutieId, uint128 _bidAmount)
        internal
        returns (uint128)
    {
        // Get a reference to the auction struct
        Auction storage auction = cutieIdToAuction[_cutieId];
        require(_isOnAuction(auction));
        // Check that bid > current price
        uint128 price = _currentPrice(auction);
        require(_bidAmount >= price);
        // Provide a reference to the seller before the auction struct is deleted.
        address seller = auction.seller;
        _removeAuction(_cutieId);
        // Transfer proceeds to seller (if there are any!)
        if (price > 0) {
            uint128 fee = _computeFee(price);
            uint128 sellerValue = price - fee;
            seller.transfer(sellerValue);
        }
        emit AuctionSuccessful(_cutieId, price, msg.sender);
        return price;
    }
}