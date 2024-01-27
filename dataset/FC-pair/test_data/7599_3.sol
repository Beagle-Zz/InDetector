contract c7599{
    // Modifier to make a function callable only when the contract is not paused.
    modifier whenNotPaused() {
        require(!paused);
        _;
    }
}