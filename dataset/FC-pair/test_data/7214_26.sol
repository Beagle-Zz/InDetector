contract c7214{
    /**
    @notice Calculates essential fund metrics
    @return {
      "gav": "Gross asset value of this fund denominated in [base unit of melonAsset]",
      "managementFee": "A time (seconds) based fee",
      "performanceFee": "A performance (rise of sharePrice measured in QUOTE_ASSET) based fee",
      "unclaimedFees": "The sum of both managementFee and performanceFee denominated in [base unit of melonAsset]",
      "feesShareQuantity": "The number of shares to be given as fees to the manager",
      "nav": "Net asset value denominated in [base unit of melonAsset]",
      "sharePrice": "Share price denominated in [base unit of melonAsset]"
    }
    */
    function performCalculations()
        view
        returns (
            uint gav,
            uint managementFee,
            uint performanceFee,
            uint unclaimedFees,
            uint feesShareQuantity,
            uint nav,
            uint sharePrice
        )
    {
        gav = calcGav(); // Reflects value independent of fees
        (managementFee, performanceFee, unclaimedFees) = calcUnclaimedFees(gav);
        nav = calcNav(gav, unclaimedFees);
        // The value of unclaimedFees measured in shares of this fund at current value
        feesShareQuantity = (gav == 0) ? 0 : mul(_totalSupply, unclaimedFees) / gav;
        // The total share supply including the value of unclaimedFees, measured in shares of this fund
        uint totalSupplyAccountingForFees = add(_totalSupply, feesShareQuantity);
        sharePrice = _totalSupply > 0 ? calcValuePerShare(gav, totalSupplyAccountingForFees) : toSmallestShareUnit(1); // Handle potential division through zero by defining a default value
    }
}