contract c10187{
    /**
     * @dev Adapted Crowdsale#hasEnded
     * @return true if crowdsale event has ended
     */
    function hasEnded() external view returns (bool) {
        return now > endTime;
    }
}