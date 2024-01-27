contract c7214{
    /// @notice Checks whether an address is whitelisted in the competition contract and competition is active
    /// @param x Address
    /// @return Whether the address is whitelisted
    function isCompetitionAllowed(
        address x
    )
        view
        returns (bool)
    {
        return CompetitionInterface(competitionAddress).isWhitelisted(x) && CompetitionInterface(competitionAddress).isCompetitionActive();
    }
}