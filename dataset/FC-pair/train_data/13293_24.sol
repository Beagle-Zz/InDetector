contract c13293{
    /**
     * @dev Checks whether the cap has been reached.
     * @return Whether the cap was reached
     */
    function capReached() external view returns (bool) {
        return weiRaised >= cap;
    }
}