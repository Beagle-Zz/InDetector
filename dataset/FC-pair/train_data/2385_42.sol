contract c2385{
    /**
     * @dev Change the bonus tier after a purchase.
     */
    function _updatePurchasingState(address _beneficiary, uint256 _weiAmount) internal {
        super._updatePurchasingState(_beneficiary, _weiAmount);
        if (capReached()) {
            if (state == SaleState.PrivateSale) {
                state = SaleState.FinalisedPrivateSale;
            }
            else if (state == SaleState.PreSale) {
                state = SaleState.FinalisedPreSale;
            }
            else if (state == SaleState.PublicSaleTier1) {
                state = SaleState.PublicSaleTier2;
            }
            else if (state == SaleState.PublicSaleTier2) {
                state = SaleState.PublicSaleTier3;
            }
            else if (state == SaleState.PublicSaleTier3) {
                state = SaleState.PublicSaleTier4;
            }
            else if (state == SaleState.PublicSaleTier4) {
                state = SaleState.FinalisedPublicSale;
            } else {
                return;
            }
            tokenCap = getCurrentTierHardcap();
            emit IncrementTieredState(getState());
        }
    }
}