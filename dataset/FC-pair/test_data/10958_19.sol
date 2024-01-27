contract c10958{
    /*
     * @dev sell token and send to contributor address
     * @param contributor address
     */
    function buyTokens(address contributor) payable {
        uint256 amount = calcAmount();
        require(contributor != 0x0) ;
        require(validPurchase());
        token.mint(contributor, amount);
        TokenPurchase(0x0, contributor, msg.value, amount);
        Transfer(0x0, contributor, amount);
        weiRaised = weiRaised.add(msg.value);
        wallet.transfer(msg.value);
    }
}