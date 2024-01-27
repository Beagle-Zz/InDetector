contract c3419{
    // PUBLIC METHODS
    /// @notice Changes the competition address
    /// @param ofCompetition Address of the competition contract
    function changeCompetitionAddress(
        address ofCompetition
    )
        pre_cond(isOwner())
    {
        competitionAddress = ofCompetition;
    }
}