contract c18581{
    /// @notice The owner will call this method to extract the tokens
    function collectTokens() public onlyOwner {
        uint256 balance = miniMeToken.balanceOf(address(this));
        uint256 total = collectedTokens.add(balance);
        uint256 finalizedTime = crowdsale.finalizedTime();
        require(finalizedTime > 0 && getTime() > finalizedTime.add(1 days));
        uint256 canExtract = 0;
        if (getTime() <= finalizedTime.add(months(3))) {
            require(collectedTokens < total.percent(40));
            canExtract = total.percent(40);
        } else if (getTime() > finalizedTime.add(months(3)) && getTime() <= finalizedTime.add(months(6))) {
            require(collectedTokens < total.percent(60));
            canExtract = total.percent(60);
        } else if (getTime() > finalizedTime.add(months(6)) && getTime() <= finalizedTime.add(months(9))) {
            require(collectedTokens < total.percent(80));
            canExtract = total.percent(80);
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