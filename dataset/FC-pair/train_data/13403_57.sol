contract c13403{
    /// @notice Return information about initial auction status.
    function isInitialAuctionEnded() public view returns (bool) {
        return (initialAuctionEndTime != 0 && 
            (now >= initialAuctionEndTime || token.totalSupply() >= INITIAL_SUPPLY));
    }
}