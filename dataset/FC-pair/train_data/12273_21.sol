contract c12273{
    /**
     * @dev Allows user to buy tokens by ether.
     * @param _recipient The recipient of tokens.
     */
    function buyTokens(address _recipient) public payable {
        require(getState() == State.PROCESSING_ORDERS);
        uint256 availableTokens = tokenBalance();
        require(availableTokens > 0);
        uint256 tokensAmount = msg.value.mul(buyRate) / RATE_MULTIPLIER;
        require(tokensAmount != 0);
        uint256 refundAmount = 0;
        // if recipient set as 0x0 - recipient is sender
        address recipient = _recipient == 0x0 ? msg.sender : _recipient;
        if (tokensAmount > availableTokens) {
            refundAmount = tokensAmount.sub(availableTokens).mul(RATE_MULTIPLIER) / buyRate;
            tokensAmount = availableTokens;
        }
        token.transfer(recipient, tokensAmount);
        Buy(msg.sender, recipient, tokensAmount, buyRate);
        if (refundAmount > 0)
            recipient.transfer(refundAmount);
    }
}