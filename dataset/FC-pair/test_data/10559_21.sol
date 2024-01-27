contract c10559{
    // low level token purchase function
    function buyTokens(address beneficiary) public payable {
        require(!isFinalized);
        require(beneficiary == msg.sender);
        require(msg.value != 0);
        require(msg.value >= individualCap);
        uint256 weiAmount = msg.value;
        require(isWhiteListedAddress(beneficiary));
        require(validPurchase(weiAmount));
        // update state
        weiRaised = weiRaised.add(weiAmount);
        uint256 _transactionId = transactionId;
        uint256 tokensAmount = weiAmount.mul(rate);
        pendingTransactions[_transactionId] = TokenPurchaseRecord(now, weiAmount, beneficiary);
        transactionId += 1;
        TokenPurchaseRequest(_transactionId, beneficiary, now, weiAmount, tokensAmount);
        forwardFunds();
    }
}