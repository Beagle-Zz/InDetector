contract c4789{
    /**
    * Send tokens by the owner directly to an address.
    */
    function sendTokensTo(uint256 amount, address to) public onlyOwner {
        require(!isFinalized);
        require(notExceedingSaleCap(amount));
        require(MintableToken(token).mint(to, amount));
        soldTokens = soldTokens.add(amount);
        emit TokenPurchase(msg.sender, to, 0, amount);
    }
}