contract c10187{
    /**
     * @dev Adapted Crowdsale#hasEnded
     * @return true if crowdsale event has started
     */
    function hasStarted() external view returns (bool) {
        return now >= startTime;
    }
}