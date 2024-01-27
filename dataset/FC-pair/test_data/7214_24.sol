contract c7214{
    /// @notice Calculates the Net asset value of this fund
    /// @param gav Gross asset value of this fund in QUOTE_ASSET and multiplied by 10 ** shareDecimals
    /// @param unclaimedFees The sum of both managementFee and performanceFee in QUOTE_ASSET and multiplied by 10 ** shareDecimals
    /// @return nav Net asset value in QUOTE_ASSET and multiplied by 10 ** shareDecimals
    function calcNav(uint gav, uint unclaimedFees)
        view
        returns (uint nav)
    {
        nav = sub(gav, unclaimedFees);
    }
}