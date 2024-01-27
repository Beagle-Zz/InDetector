contract c2730{
    /// @dev Called by any "C-level" role to pause the contract. Used only when
    ///  a bug or exploit is detected and we need to limit damage.
    function pause()
        external
        onlyCLevel
        whenNotPaused
    {
        paused = true;
        emit ContractIsPaused(paused);
    }
}