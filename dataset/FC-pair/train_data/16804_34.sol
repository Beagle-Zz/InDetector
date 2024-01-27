contract c16804{
    /// @notice The owner will call this method to extract the tokens
    function collectTokens() public onlyOwner {
        uint256 balance = miniMeToken.balanceOf(address(this));
        uint256 total = collectedTokens.add(balance);
        uint256 finalizedTime = crowdsale.finalizedTime();
        require(finalizedTime > 0 && getTime() > finalizedTime.add(months(18)));
        uint256 canExtract = 0;
        if (getTime() <= finalizedTime.add(months(36))) {
            require(collectedTokens < total.percent(50));
            canExtract = total.percent(50);
        } else {
            require(collectedTokens < total);
            canExtract = total;
        }
        canExtract = canExtract.sub(collectedTokens);
        if (canExtract > balance) {
            canExtract = balance;
        }
        collectedTokens = collectedTokens.add(canExtract);
        miniMeToken.transfer(owner, canExtract);
        TokensWithdrawn(owner, canExtract);
    }
}