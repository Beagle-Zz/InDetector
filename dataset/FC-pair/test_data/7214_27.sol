contract c7214{
    /// @notice Converts unclaimed fees of the manager into fund shares
    /// @return sharePrice Share price denominated in [base unit of melonAsset]
    function calcSharePriceAndAllocateFees() public returns (uint)
    {
        var (
            gav,
            managementFee,
            performanceFee,
            unclaimedFees,
            feesShareQuantity,
            nav,
            sharePrice
        ) = performCalculations();
        createShares(owner, feesShareQuantity); // Updates _totalSupply by creating shares allocated to manager
        // Update Calculations
        uint highWaterMark = atLastUnclaimedFeeAllocation.highWaterMark >= sharePrice ? atLastUnclaimedFeeAllocation.highWaterMark : sharePrice;
        atLastUnclaimedFeeAllocation = Calculations({
            gav: gav,
            managementFee: managementFee,
            performanceFee: performanceFee,
            unclaimedFees: unclaimedFees,
            nav: nav,
            highWaterMark: highWaterMark,
            totalSupply: _totalSupply,
            timestamp: now
        });
        emit FeesConverted(now, feesShareQuantity, unclaimedFees);
        emit CalculationUpdate(now, managementFee, performanceFee, nav, sharePrice, _totalSupply);
        return sharePrice;
    }
}