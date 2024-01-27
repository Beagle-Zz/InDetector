contract c136{
    /// @return the token price with the fees
    function getTokenPrice(uint256 tokenId) public view
    isOnMarket(tokenId) returns (uint256) {
        return market[tokenId].price + (market[tokenId].price / 100 * marketMakerFee);
    }
}