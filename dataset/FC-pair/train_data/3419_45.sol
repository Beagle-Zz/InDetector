contract c3419{
    // PUBLIC VIEW METHODS
    /// @notice Checks whether investment is permitted for a participant
    /// @param ofParticipant Address requesting to invest in a Melon fund
    /// @param giveQuantity Quantity of Melon token times 10 ** 18 offered to receive shareQuantity
    /// @param shareQuantity Quantity of shares times 10 ** 18 requested to be received
    /// @return Whether identity is eligible to invest in a Melon fund.
    function isInvestmentPermitted(
        address ofParticipant,
        uint256 giveQuantity,
        uint256 shareQuantity
    )
        view
        returns (bool)
    {
        return competitionAddress == ofParticipant;
    }
}