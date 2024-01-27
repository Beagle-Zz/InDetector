contract c253{
    /*** Pausable functionality adapted from OpenZeppelin ***/
    /// @dev Modifier to allow actions only when the contract IS NOT paused
    modifier whenNotPaused() {
        require(!paused);
        _;
    }
}