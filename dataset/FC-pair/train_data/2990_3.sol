contract c2990{
    // Check that the generation period is not started
    modifier isNotStarted() {
        require(!started);
        _;
    }
}