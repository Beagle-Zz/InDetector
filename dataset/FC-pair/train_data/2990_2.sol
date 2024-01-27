contract c2990{
    // Check that the generation period is started
    modifier isStarted() {
        require(started);
        _;
    }
}