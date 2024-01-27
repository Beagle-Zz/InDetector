contract c2755{
    /**
     * @dev Allows a function to be called only when the token contract is not paused.
     */
    modifier whenNotPaused() {
        require(!paused);
        _;
    }
}