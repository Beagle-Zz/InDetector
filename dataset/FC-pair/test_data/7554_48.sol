contract c7554{
    /// @dev clears an Auction
    /// @param sellToken sellToken of the auction
    /// @param buyToken  buyToken of the auction
    /// @param auctionIndex of the auction to be cleared.
    function clearAuction(
        address sellToken,
        address buyToken,
        uint auctionIndex,
        uint sellVolume
    )
        internal
    {
        // Get variables
        uint buyVolume = buyVolumes[sellToken][buyToken];
        uint sellVolumeOpp = sellVolumesCurrent[buyToken][sellToken];
        uint closingPriceOppDen = closingPrices[buyToken][sellToken][auctionIndex].den;
        uint auctionStart = getAuctionStart(sellToken, buyToken);
        // Update closing price
        if (sellVolume > 0) {
            closingPrices[sellToken][buyToken][auctionIndex] = fraction(buyVolume, sellVolume);
        }
        // if (opposite is 0 auction OR price = 0 OR opposite auction cleared)
        // price = 0 happens if auction pair has been running for >= 24 hrs = 86400
        if (sellVolumeOpp == 0 || now >= auctionStart + 86400 || closingPriceOppDen > 0) {
            // Close auction pair
            uint buyVolumeOpp = buyVolumes[buyToken][sellToken];
            if (closingPriceOppDen == 0 && sellVolumeOpp > 0) {
                // Save opposite price
                closingPrices[buyToken][sellToken][auctionIndex] = fraction(buyVolumeOpp, sellVolumeOpp);
            }
            uint sellVolumeNext = sellVolumesNext[sellToken][buyToken];
            uint sellVolumeNextOpp = sellVolumesNext[buyToken][sellToken];
            // Update state variables for both auctions
            sellVolumesCurrent[sellToken][buyToken] = sellVolumeNext;
            if (sellVolumeNext > 0) {
                sellVolumesNext[sellToken][buyToken] = 0;
            }
            if (buyVolume > 0) {
                buyVolumes[sellToken][buyToken] = 0;
            }
            sellVolumesCurrent[buyToken][sellToken] = sellVolumeNextOpp;
            if (sellVolumeNextOpp > 0) {
                sellVolumesNext[buyToken][sellToken] = 0;
            }
            if (buyVolumeOpp > 0) {
                buyVolumes[buyToken][sellToken] = 0;
            }
            // Increment auction index
            setAuctionIndex(sellToken, buyToken);
            // Check if next auction can be scheduled
            scheduleNextAuction(sellToken, buyToken);
        }
        AuctionCleared(sellToken, buyToken, sellVolume, buyVolume, auctionIndex);
    }
}