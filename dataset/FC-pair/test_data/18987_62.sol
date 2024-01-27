contract c18987{
    /// @notice Exploration Time: The time it takes to explore a Sector is dependent on the Sector Size
    ///         along with the Ship’s Range and Speed.
    /// @param _shipRange ship range
    /// @param _shipSpeed ship speed
    /// @param _sectorSize sector size
    function _explorationTime(
        uint8 _shipRange,
        uint8 _shipSpeed,
        uint8 _sectorSize
    ) private view returns (int256) {
        int256 minToExplore = 0;
        minToExplore = SafeMath.min(_shipSpeed, SPEED_STAT_MAX) - 1;
        minToExplore = -72 * minToExplore;
        minToExplore += MAX_TIME_EXPLORE;
        uint256 minRange = uint256(SafeMath.min(_shipRange, RANGE_STAT_MAX));
        uint256 scaledRange = uint256(RANGE_STAT_MAX * RANGE_SCALE);
        int256 minExplore = (minToExplore - MIN_TIME_EXPLORE);
        minToExplore -= fraction(minExplore, int256(minRange), int256(scaledRange));
        minToExplore += fraction(minToExplore, int256(_sectorSize) - int256(10), 10);
        minToExplore = SafeMath.max(minToExplore, MIN_TIME_EXPLORE);
        return minToExplore;
    }
}