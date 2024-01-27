contract c10739{
    /**
     * @dev buy tokens
     */
    function buyTokens() public payable {
        validatePurchase(msg.value);
        uint256 tokenToBuy = msg.value.mul(rate);
        whiteList[msg.sender].lastPurchasedTimestamp = now;
        weiRaised = weiRaised.add(msg.value);
        token.mint(msg.sender, tokenToBuy);
        wallet.transfer(msg.value);
        emit BuyTokens(msg.value, rate, tokenToBuy, msg.sender);
    }
}