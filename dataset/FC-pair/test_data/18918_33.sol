contract c18918{
    /// @dev Returns auction info for an NFT on auction.
    /// @param _tokenId - ID of NFT on auction.
    function getAuctionData(uint _tokenId) external view returns (
        address seller,
        uint startingPrice,
        uint endingPrice,
        uint duration,
        uint startedAt,
        uint currentPrice
    ) {
        Auction storage auction = tokenIdToAuction[_tokenId];
        require(auction.startedAt > 0);
        seller = auction.seller;
        startingPrice = auction.startingPrice;
        endingPrice = auction.endingPrice;
        duration = auction.duration;
        startedAt = auction.startedAt;
        currentPrice = _calcCurrentPrice(auction);
    }
}