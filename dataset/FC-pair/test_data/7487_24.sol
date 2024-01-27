contract c7487{
    /// @notice `onlyOwner` Changes `timeLock`; the new `timeLock` cannot be
    ///  lower than `absoluteMinTimeLock`
    /// @param _newTimeLock Sets the new minimum default `timeLock` in seconds;
    ///  pending payments maintain their `earliestPayTime`
    function setTimelock(uint _newTimeLock) onlyOwner external {
        require(_newTimeLock >= absoluteMinTimeLock);
        timeLock = _newTimeLock;
    }
}