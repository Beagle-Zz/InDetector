contract c3419{
    // PRICES
    /// @notice Whether price of asset has been updated less than VALIDITY seconds ago
    /// @param ofAsset Asset in registrar
    /// @return isRecent Price information ofAsset is recent
    function hasRecentPrice(address ofAsset)
        view
        pre_cond(assetIsRegistered(ofAsset))
        returns (bool isRecent)
    {
        var ( , timestamp) = getPrice(ofAsset);
        return (sub(now, timestamp) <= VALIDITY);
    }
}