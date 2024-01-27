contract c16388{
    /// @dev modifier to allow actions only when the contract IS NOT paused
    modifier whenNotPaused {
        require(!paused);
        _;
    }
}