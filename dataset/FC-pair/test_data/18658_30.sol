contract c18658{
    /// @dev Returns auction info for an NFT on auction.
    /// @param _tokenId - ID of NFT on auction.
    function getAuction(uint256 _tokenId)
        external
        view
        returns
    (
        address highestBidder,
        uint highestBid,
        uint endTime,
        bool live
    ) {
        Auction storage auction = tokenIdToAuction[_tokenId];
        return (
            auction.highestBidder,
            auction.highestBid,
            auction.endTime,
            auction.live
        );
    }
}