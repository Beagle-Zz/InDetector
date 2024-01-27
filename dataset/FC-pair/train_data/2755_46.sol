contract c2755{
    /**
     * @dev Checks if the soft cap was reached by the fundraiser.
     *
     * @return Whether `softCap` is reached or not.
     */
    function softCapReached() public view returns (bool) {
        return totalRaised >= softCap;
    }
}