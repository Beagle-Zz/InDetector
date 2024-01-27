contract c7214{
    /**
    @notice Calculates unclaimed fees of the fund manager
    @param gav Gross asset value in QUOTE_ASSET and multiplied by 10 ** shareDecimals
    @return {
      "managementFees": "A time (seconds) based fee in QUOTE_ASSET and multiplied by 10 ** shareDecimals",
      "performanceFees": "A performance (rise of sharePrice measured in QUOTE_ASSET) based fee in QUOTE_ASSET and multiplied by 10 ** shareDecimals",
      "unclaimedfees": "The sum of both managementfee and performancefee in QUOTE_ASSET and multiplied by 10 ** shareDecimals"
    }
    */
    function calcUnclaimedFees(uint gav)
        view
        returns (
            uint managementFee,
            uint performanceFee,
            uint unclaimedFees)
    {
        // Management fee calculation
        uint timePassed = sub(now, atLastUnclaimedFeeAllocation.timestamp);
        uint gavPercentage = mul(timePassed, gav) / (1 years);
        managementFee = wmul(gavPercentage, MANAGEMENT_FEE_RATE);
        // Performance fee calculation
        // Handle potential division through zero by defining a default value
        uint valuePerShareExclMgmtFees = _totalSupply > 0 ? calcValuePerShare(sub(gav, managementFee), _totalSupply) : toSmallestShareUnit(1);
        if (valuePerShareExclMgmtFees > atLastUnclaimedFeeAllocation.highWaterMark) {
            uint gainInSharePrice = sub(valuePerShareExclMgmtFees, atLastUnclaimedFeeAllocation.highWaterMark);
            uint investmentProfits = wmul(gainInSharePrice, _totalSupply);
            performanceFee = wmul(investmentProfits, PERFORMANCE_FEE_RATE);
        }
        // Sum of all FEES
        unclaimedFees = add(managementFee, performanceFee);
    }
}