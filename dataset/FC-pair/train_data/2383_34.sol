contract c2383{
    /**
     * @notice Checks whether the tokenCap has been reached.
     * @return Whether the tokenCap was reached
     */
    function capReached() public view returns (bool) {
        return tokensRaised >= tokenCap;
    }
}