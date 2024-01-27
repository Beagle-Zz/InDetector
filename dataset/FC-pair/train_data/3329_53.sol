contract c3329{
    /**
     * @dev Overrides TimedCrowdsale#hasClosed method to end sale permaturely if token cap has been reached.
     * @return Whether crowdsale has finished
     */
    function hasClosed() public view returns (bool) {
        return tokenCapReached() || super.hasClosed();
    }
}