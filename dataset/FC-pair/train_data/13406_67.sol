contract c13406{
    /// @notice Calculate results of a purchase
    /// @param _wei Amount of wei the purchaser will pay
    /// @param _t Prospective purchase tick
    /// @return weiPerToken expected MET token rate
    /// @return tokens Expected token for a prospective purchase
    /// @return refund Wei refund the purchaser will get if amount is excess and MET supply is less
    function calcPurchase(uint _wei, uint _t) internal view returns (uint weiPerToken, uint tokens, uint refund)
    {
        require(_t >= lastPurchaseTick);
        uint numTicks = _t - lastPurchaseTick;
        if (isInitialAuctionEnded()) {
            weiPerToken = priceAt(lastPurchasePrice, numTicks);
        } else {
            weiPerToken = priceAtInitialAuction(lastPurchasePrice, numTicks);
        }
        uint calctokens = METDECMULT.mul(_wei).div(weiPerToken);
        tokens = calctokens;
        if (calctokens > mintable) {
            tokens = mintable;
            uint ethPaying = mintable.mul(weiPerToken).div(METDECMULT);
            refund = _wei.sub(ethPaying);
        }
    }
}