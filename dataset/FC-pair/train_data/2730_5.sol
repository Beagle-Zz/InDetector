contract c2730{
    /// @dev Unpauses the smart contract. Can only be called by the CEO
    /// @notice This is public rather than external so it can be called by
    ///  derived contracts.
    function unpause()
        public
        onlyCEO
        whenPaused
    {
        // can't unpause if contract was forked
        paused = false;
        emit ContractIsPaused(paused);
    }
}