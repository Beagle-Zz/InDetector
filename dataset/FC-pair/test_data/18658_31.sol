contract c18658{
    /// @dev Returns the current price of an auction.
    /// @param _tokenId - ID of the token price we are checking.
    function getHighestBid(uint256 _tokenId)
        external
        view
        returns (uint256)
    {
        Auction storage auction = tokenIdToAuction[_tokenId];
        return auction.highestBid;
    }
}