contract c7497{
    /// @dev Gives best estimate for market price of a token in ETH of any price oracle on the Ethereum network
    /// @param token address of ERC-20 token
    /// @return Weighted average of closing prices of opposite Token-ethToken auctions, based on their sellVolume  
    function getPriceOfTokenInLastAuction(
        address token
    )
        public
        view
        // price < 10^31
        returns (uint num, uint den)
    {
        uint latestAuctionIndex = getAuctionIndex(token, ethToken);
        // getPriceInPastAuction < 10^30
        (num, den) = getPriceInPastAuction(token, ethToken, latestAuctionIndex - 1);
    }
}