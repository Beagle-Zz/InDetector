contract c13401{
    /// @notice current tick(minute) of the metronome clock
    /// @return tick count
    function currentTick() public view returns(uint) {
        return whichTick(block.timestamp);
    }
}