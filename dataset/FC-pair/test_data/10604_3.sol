contract c10604{
    /*
        @notice Unpauses the balancer.
        @dev Only the owner can unpause
    */
    function unpause() public onlyOwner returns (bool) {
        paused = false;
        return true;
    }
}