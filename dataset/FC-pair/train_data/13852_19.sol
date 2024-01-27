contract c13852{
    /**
     * @dev Get the date floor (UTC midnight) for a given timestamp
     * @notice Doesn't change state
     * @param _timestamp (unix time: uint32)
     * @return UTC midnight date (unix time: uint32)
     */
    function getDate(uint32 _timestamp) internal pure returns (uint32) {
        return _timestamp.sub(_timestamp % DAY);
    }
}