contract c1167{
    // ************************************************************************
    // Modifier to make a function callable only when the contract is paused.
    // ************************************************************************
    modifier whenPaused() {
        require(paused);
        _;
    }
}