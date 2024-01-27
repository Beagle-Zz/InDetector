contract c13852{
    /**
     * @dev Get the next UTC midnight date
     * @notice Doesn't change state
     * @param _timestamp (unix time: uint32)
     * @return Next date (unix time: uint32)
     */
    function getNextDate(uint32 _timestamp) internal pure returns (uint32) {
        return getDate(_timestamp.add(DAY));
    }
}