contract c1579{
    /**
    * @dev modifier to allow actions only when the contract IS paused
    */
    modifier whenNotPaused() {
        if (paused) throw;
        _;
    }
}