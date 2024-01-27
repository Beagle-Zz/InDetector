contract c7214{
    // PUBLIC VIEW METHODS
    /// @notice Calculates sharePrice denominated in [base unit of melonAsset]
    /// @return sharePrice Share price denominated in [base unit of melonAsset]
    function calcSharePrice() view returns (uint sharePrice) {
        (, , , , , sharePrice) = performCalculations();
        return sharePrice;
    }
}