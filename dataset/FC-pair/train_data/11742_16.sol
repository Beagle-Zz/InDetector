contract c11742{
    /// @notice Given a rect to purchase and the plot index, return the total price to be paid. Requires that the plot is for sale
    /// @param subPlotToPurchase The subplot of plotIndex which we want to compute the price of
    /// @param plotIndex The index in the ownership array for this plot
    /// @return The price that must be paid for this subPlot
    function getPriceOfPlot(Geometry.Rect memory subPlotToPurchase, uint256 plotIndex) private view returns (uint256) {
        // Verify that this plot exists in the plot price mapping with a price.
        uint256 plotPricePerPixel = plotIdToPrice[plotIndex];
        require(plotPricePerPixel > 0);
        return SafeMath.mul(SafeMath.mul(subPlotToPurchase.w, subPlotToPurchase.h), plotPricePerPixel);
    }
}