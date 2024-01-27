contract c18828{
    // spend available and purchase up more if not enough
    function purchaseUpAndSpend(uint256 tokensToSpend, uint256 maxPrice, bytes32 orderId) public payable returns(uint256 tokensSpent_){
        uint256 tokensToPurchaseUp = tokensToSpend.sub(token.balanceOf(msg.sender));
        uint256 currentPrice = getPurchasePrice(msg.value, tokensToPurchaseUp);
        uint256 tokensAvailableByCurrentPrice = msg.value.mul(1e18).div(currentPrice);
        require(tokensToPurchaseUp <= tokensAvailableByCurrentPrice);
        if (tokensToPurchaseUp>0) {
            purchase(tokensToPurchaseUp, maxPrice);
        }
        spend(tokensToSpend, orderId);
        return tokensToSpend;
    }
}