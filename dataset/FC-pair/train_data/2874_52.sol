contract c2874{
    /// @notice resume paused ICO
    function unpause()
        external
        timedStateChange(address(0), 0, true)
        requiresState(IcoState.PAUSED)
        onlymanyowners(keccak256(msg.data))
    {
        changeState(IcoState.ACTIVE);
        checkTime();
    }
}