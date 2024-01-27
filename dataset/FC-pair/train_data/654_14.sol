contract c654{
    /// @return the token price with the fees
    function getTokenPrice(uint256 tokenId) public view
    isOnMarket(tokenId) returns (uint256) {
        return market[tokenId].price + (market[tokenId].price.div(100).mul(marketMakerFee));
    }
}