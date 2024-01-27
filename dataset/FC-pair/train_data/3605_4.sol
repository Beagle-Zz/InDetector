contract c3605{
    /// @notice Checks whether an address is whitelisted in the competition contract and competition is active
    /// @param user Address
    /// @return Whether the address is whitelisted
    function isCompetitionAllowed(address user)
        view
        returns (bool)
    {
        return isWhitelisted[user];
    }
}