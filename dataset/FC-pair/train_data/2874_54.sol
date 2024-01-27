contract c2874{
    /// @notice In case we need to attach to existent funds
    function setFundsRegistry(address _funds)
        external
        validAddress(_funds)
        timedStateChange(address(0), 0, true)
        requiresState(IcoState.PAUSED)
        onlymanyowners(keccak256(msg.data))
    {
        m_funds = FundsRegistry(_funds);
    }
}