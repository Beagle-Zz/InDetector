contract c13409{
    /// @notice Calculate number of ticks elapsed between auction start time and given tick.
    /// @param _tick Given metronome tick
    function numTicksSinceAuctionStart(uint _tick) private view returns (uint ) {
        uint currentAuctionStartTime = auctionStartTime(_tick);
        return _tick - whichTick(currentAuctionStartTime);
    }
}