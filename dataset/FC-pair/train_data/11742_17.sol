contract c11742{
    /// @notice Stores the plot information and data for a newly purchased plot.
    /// @dev All parameters are assumed to be validated before calling
    /// @param purchase The coordinates of the plot to purchase
    /// @param ipfsHash The hash of the image data for this plot stored in ipfs
    /// @param url The website / url which should be associated with this plot
    /// @param initialBuyoutPriceInWeiPerPixel The price per pixel a future buyer would have to pay to purchase an area of this plot.
    /// @return The index in the plotOwnership array where this plot was placed
    function addPlotAndData(uint24[] purchase, string ipfsHash, string url, uint256 initialBuyoutPriceInWeiPerPixel) private returns (uint256) {
        uint256 newPlotIndex = ownership.length;
        // Add the new ownership to the array
        ownership.push(PlotOwnership(purchase[0], purchase[1], purchase[2], purchase[3], msg.sender));
        // Take in the input data for the actual grid!
        data[newPlotIndex] = PlotData(ipfsHash, url);
        // Set an initial purchase price for the new plot if it's greater than 0
        if (initialBuyoutPriceInWeiPerPixel > 0) {
            plotIdToPrice[newPlotIndex] = initialBuyoutPriceInWeiPerPixel;
        }
        return newPlotIndex;
    }
}