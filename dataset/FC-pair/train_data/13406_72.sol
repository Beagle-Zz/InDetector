contract c13406{
    /// @notice First calculate the auction which contains the given tick and then calculate
    /// auction start time of given tick.
    /// @param _tick Metronome tick
    function auctionStartTime(uint _tick) private view returns (uint) {
        return ((whichAuction(_tick)) * 1 days) / timeScale + dailyAuctionStartTime - 1 days;
    }
}