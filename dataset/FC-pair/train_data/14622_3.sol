contract c14622{
    /**
     * @dev Modifier to make a function callable only when the contract is paused.
     */
    modifier IsPaused() {
        require(isPaused);
        _;
    }
}