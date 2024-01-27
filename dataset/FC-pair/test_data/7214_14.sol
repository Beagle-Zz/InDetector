contract c7214{
    // EXTERNAL METHODS
    // EXTERNAL : ADMINISTRATION
    /// @notice Enable investment in specified assets
    /// @param ofAssets Array of assets to enable investment in
    function enableInvestment(address[] ofAssets)
        external
        pre_cond(isOwner())
    {
        for (uint i = 0; i < ofAssets.length; ++i) {
            require(modules.pricefeed.assetIsRegistered(ofAssets[i]));
            isInvestAllowed[ofAssets[i]] = true;
        }
    }
}