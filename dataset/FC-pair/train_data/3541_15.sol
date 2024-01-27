contract c3541{
    /// @notice Disable investment in specified assets
    /// @param ofAssets Array of assets to disable investment in
    function disableInvestment(address[] ofAssets)
        external
        pre_cond(isOwner())
    {
        for (uint i = 0; i < ofAssets.length; ++i) {
            isInvestAllowed[ofAssets[i]] = false;
        }
    }
}