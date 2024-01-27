contract c16922{
    // @dev Cancels auction when contract is on pause. Option is available only to owners in urgent situations. Tokens returned to seller.
    //  Used on Core contract upgrade.
    function cancelActiveAuctionWhenPaused(uint40 _cutieId) whenPaused onlyOwner public
    {
        Auction storage auction = cutieIdToAuction[_cutieId];
        require(_isOnAuction(auction));
        _cancelActiveAuction(_cutieId, auction.seller);
    }
}