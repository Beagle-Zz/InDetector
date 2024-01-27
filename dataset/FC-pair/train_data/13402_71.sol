contract c13402{
    /// @notice Calculate number of ticks elapsed between lastPurchaseTick and auctions start time of given tick.
    /// @param _tick Given metronome tick
    function numTicksTillAuctionStart(uint _tick) private view returns (uint) {
        uint currentAuctionStartTime = auctionStartTime(_tick);
        return whichTick(currentAuctionStartTime) - lastPurchaseTick;
    }
}