contract c3419{
    // PUBLIC METHODS
    // PUBLIC METHODS : ACCOUNTING
    /// @notice Calculates gross asset value of the fund
    /// @dev Decimals in assets must be equal to decimals in PriceFeed for all entries in AssetRegistrar
    /// @dev Assumes that module.pricefeed.getPriceInfo(..) returns recent prices
    /// @return gav Gross asset value quoted in QUOTE_ASSET and multiplied by 10 ** shareDecimals
    function calcGav() returns (uint gav) {
        // prices quoted in QUOTE_ASSET and multiplied by 10 ** assetDecimal
        uint[] memory allAssetHoldings = new uint[](ownedAssets.length);
        uint[] memory allAssetPrices = new uint[](ownedAssets.length);
        address[] memory tempOwnedAssets;
        tempOwnedAssets = ownedAssets;
        delete ownedAssets;
        for (uint i = 0; i < tempOwnedAssets.length; ++i) {
            address ofAsset = tempOwnedAssets[i];
            // assetHoldings formatting: mul(exchangeHoldings, 10 ** assetDecimal)
            uint assetHoldings = add(
                uint(AssetInterface(ofAsset).balanceOf(address(this))), // asset base units held by fund
                quantityHeldInCustodyOfExchange(ofAsset)
            );
            // assetPrice formatting: mul(exchangePrice, 10 ** assetDecimal)
            var (isRecent, assetPrice, assetDecimals) = modules.pricefeed.getPriceInfo(ofAsset);
            if (!isRecent) {
                revert();
            }
            allAssetHoldings[i] = assetHoldings;
            allAssetPrices[i] = assetPrice;
            // gav as sum of mul(assetHoldings, assetPrice) with formatting: mul(mul(exchangeHoldings, exchangePrice), 10 ** shareDecimals)
            gav = add(gav, mul(assetHoldings, assetPrice) / (10 ** uint256(assetDecimals)));   // Sum up product of asset holdings of this vault and asset prices
            if (assetHoldings != 0 || ofAsset == address(QUOTE_ASSET) || isInOpenMakeOrder[ofAsset]) { // Check if asset holdings is not zero or is address(QUOTE_ASSET) or in open make order
                ownedAssets.push(ofAsset);
            } else {
                isInAssetList[ofAsset] = false; // Remove from ownedAssets if asset holdings are zero
            }
        }
        emit PortfolioContent(tempOwnedAssets, allAssetHoldings, allAssetPrices);
    }
}