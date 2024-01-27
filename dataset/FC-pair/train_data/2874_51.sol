contract c2874{
    // PUBLIC interface: owners: maintenance
    /// @notice pauses ICO
    function pause()
        external
        timedStateChange(address(0), 0, true)
        requiresState(IcoState.ACTIVE)
        onlyowner
    {
        changeState(IcoState.PAUSED);
    }
}