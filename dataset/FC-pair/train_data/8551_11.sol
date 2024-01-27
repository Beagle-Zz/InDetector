contract c8551{
    /**
    * @dev modifier to allow actions only when the contract IS NOT paused
    */
    modifier whenPaused {
        if (!paused) throw;
        _;
    }
}