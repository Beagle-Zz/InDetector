contract c18987{
    /// @notice Any C-level can fix how many seconds per blocks are currently observed.
    /// @param _secs The seconds per block
    function setSecondsPerBlock(uint256 _secs) external onlyCLevel {
        require(_secs > 0);
        secondsPerBlock = _secs;
    }
}