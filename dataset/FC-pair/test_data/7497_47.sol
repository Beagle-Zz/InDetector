contract c7497{
    /// @dev Claim buyer funds for one auction
    function getUnclaimedBuyerFunds(
        address sellToken,
        address buyToken,
        address user,
        uint auctionIndex
    )
        public
        view
        // < (10^67, 10^37)
        returns (uint unclaimedBuyerFunds, uint num, uint den)
    {
        // R1: checks if particular auction has ever run
        require(auctionIndex <= getAuctionIndex(sellToken, buyToken));
        (num, den) = getCurrentAuctionPrice(sellToken, buyToken, auctionIndex);
        if (num == 0) {
            // This should rarely happen - as long as there is >= 1 buy order,
            // auction will clear before price = 0. So this is just fail-safe
            unclaimedBuyerFunds = 0;
        } else {
            uint buyerBalance = buyerBalances[sellToken][buyToken][auctionIndex][user];
            // < 10^30 * 10^37 = 10^67
            unclaimedBuyerFunds = atleastZero(int(
                mul(buyerBalance, den) / num - 
                claimedAmounts[sellToken][buyToken][auctionIndex][user]
            ));
        }
    }
}