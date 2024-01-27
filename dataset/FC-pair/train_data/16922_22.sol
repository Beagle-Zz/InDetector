contract c16922{
    // @dev Returns auction info for a token on auction.
    // @param _cutieId - ID of token on auction.
    function getAuctionInfo(uint40 _cutieId)
        public
        view
        returns
    (
        address seller,
        uint128 startPrice,
        uint128 endPrice,
        uint40 duration,
        uint40 startedAt,
        uint128 featuringFee
    ) {
        Auction storage auction = cutieIdToAuction[_cutieId];
        require(_isOnAuction(auction));
        return (
            auction.seller,
            auction.startPrice,
            auction.endPrice,
            auction.duration,
            auction.startedAt,
            auction.featuringFee
        );
    }
}