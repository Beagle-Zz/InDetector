contract c13405{
    /// @notice prepare auction when first import is done on a non ETH chain
    function prepareAuctionForNonOGChain() public {
        require(msg.sender == address(token.tokenPorter()) || msg.sender == address(token));
        require(token.totalSupply() == 0);
        require(chain != "ETH");
        lastPurchaseTick = currentTick();
    }
}