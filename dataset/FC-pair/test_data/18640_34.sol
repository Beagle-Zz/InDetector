contract c18640{
    /// @notice The owner will call this method to extract the tokens
    function collectTokens() public onlyOwner {
        uint256 balance = miniMeToken.balanceOf(address(this));
        uint256 total = collectedTokens.add(balance);
        uint256 finalizedTime = crowdsale.finalizedTime();
        require(finalizedTime > 0 && getTime() > finalizedTime.add(months(2)));
        uint256 canExtract = 0;
        if (getTime() <= finalizedTime.add(months(3))) {
            require(collectedTokens < total.percent(20));
            canExtract = total.percent(20);
        } else if (getTime() > finalizedTime.add(months(3)) && getTime() <= finalizedTime.add(months(4))) {
            require(collectedTokens < total.percent(40));
            canExtract = total.percent(40);
        } else if (getTime() > finalizedTime.add(months(4)) && getTime() <= finalizedTime.add(months(5))) {
            require(collectedTokens < total.percent(60));
            canExtract = total.percent(60);
        } else if (getTime() > finalizedTime.add(months(5)) && getTime() <= finalizedTime.add(months(6))) {
            require(collectedTokens < total.percent(80));
            canExtract = total.percent(80);
        } else {
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