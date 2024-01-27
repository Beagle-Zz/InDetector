contract c16197{
    // Owner functions
    /// Emergency function to pause buy-in and finalisation.
    function setPaused(bool _paused) public only_owner { paused = _paused; }
}