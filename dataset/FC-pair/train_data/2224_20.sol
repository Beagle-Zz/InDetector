contract c2224{
    /// @notice Get the GOT price in WEI during the auction, at the time of
    /// calling this function. Returns 0 if auction has ended.
    /// Returns "price_start" before auction has started.
    /// @dev Calculates the current GOT token price in WEI.
    /// @return Returns WEI per indivisible GOT (token_multiplier * GOT).
    function price() public constant returns (uint256) {
        if (stage == Stages.AuctionEnded ||
            stage == Stages.TokensDistributed) {
            return 0;
        }
        return calcTokenPrice();
    }
}