contract c7962{
    /// @dev Computes the payment for the token, which is the sale price of the token
    /// minus the house's cut.
    function computePayment(
        uint256 _tokenId,
        uint256 _salePrice)
    internal
    view
    returns(uint256) {
        uint256 prevSalePrice = animecardPrevPrice[_tokenId];
        uint256 profit = _salePrice - prevSalePrice;
        uint256 ownerCut = SafeMath.sub(100, platformFee);
        uint256 ownerProfitShare = SafeMath.div(SafeMath.mul(profit, ownerCut), 100);
        return prevSalePrice + ownerProfitShare;
    }
}