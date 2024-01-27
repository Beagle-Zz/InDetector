contract c18051{
    /// @dev Transfers the balance of the sale auction contract
    /// to the ArtworkCore contract. We use two-step withdrawal to
    /// prevent two transfer calls in the auction bid function.
    function withdrawAuctionBalances() external onlyCLevel {
        saleAuction.withdrawBalance();
    }
}