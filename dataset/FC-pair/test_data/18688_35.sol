contract c18688{
    /**
    * @dev  Modifier to prepend to functions adding the additional
    *       conditional requiring the paused bool to be false.
    */
    modifier onlyIfNotPaused() {
        require(!paused);
        _;
    }
}