contract c16922{
    // @dev Adds to the list of open auctions and fires the
    //  AuctionCreated event.
    // @param _cutieId The token ID is to be put on auction.
    // @param _auction To add an auction.
    // @param _fee Amount of money to feature auction
    function _addAuction(uint40 _cutieId, Auction _auction) internal
    {
        // Require that all auctions have a duration of
        // at least one minute. (Keeps our math from getting hairy!)
        require(_auction.duration >= 1 minutes);
        cutieIdToAuction[_cutieId] = _auction;
        emit AuctionCreated(
            _cutieId,
            _auction.startPrice,
            _auction.endPrice,
            _auction.duration,
            _auction.featuringFee
        );
    }
}