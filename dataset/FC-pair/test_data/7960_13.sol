contract c7960{
    /**
     * @dev Adds additional check if the hard cap has been reached.
     *
     * @return Whether the token purchase will be allowed.
     */
    function validateTransaction() internal view {
        super.validateTransaction();
        require(totalRaised < hardCap);
    }
}