contract c12408{
    /**
     * @dev Access modifier, which restricts a call to happen once the game is started
     */
    modifier isStarted() {
        require(started);
        _;
    }
}