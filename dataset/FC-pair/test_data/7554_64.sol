contract c7554{
    //@dev for multiple withdraws
    //@param auctionSellTokens are the sellTokens defining an auctionPair
    //@param auctionBuyTokens are the buyTokens defining an auctionPair
    //@param auctionIndices are the auction indices on which an token should be claimedAmounts
    //@param user is the user who wants to his tokens
    function claimTokensFromSeveralAuctionsAsSeller(
        address[] auctionSellTokens,
        address[] auctionBuyTokens,
        uint[] auctionIndices,
        address user
    )
        external
    {
        uint length = auctionSellTokens.length;
        uint length2 = auctionBuyTokens.length;
        require(length == length2);
        uint length3 = auctionIndices.length;
        require(length2 == length3);
        for (uint i = 0; i < length; i++)
            claimSellerFunds(auctionSellTokens[i], auctionBuyTokens[i], user, auctionIndices[i]);
    }
}