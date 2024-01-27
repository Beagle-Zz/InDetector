contract c7554{
    //@dev for quick overview of current sellerBalances for a user
    //@param auctionSellTokens are the sellTokens defining an auctionPair
    //@param auctionBuyTokens are the buyTokens defining an auctionPair
    //@param user is the user who wants to his tokens
    function getSellerBalancesOfCurrentAuctions(
        address[] auctionSellTokens,
        address[] auctionBuyTokens,
        address user
    )
        external
        view
        returns (uint[])
    {
        uint length = auctionSellTokens.length;
        uint length2 = auctionBuyTokens.length;
        require(length == length2);
        uint[] memory sellersBalances = new uint[](length);
        for (uint i = 0; i < length; i++) {
            uint runningAuctionIndex = getAuctionIndex(auctionSellTokens[i], auctionBuyTokens[i]);
            sellersBalances[i] = sellerBalances[auctionSellTokens[i]][auctionBuyTokens[i]][runningAuctionIndex][user];
        }
        return sellersBalances;
    }
}