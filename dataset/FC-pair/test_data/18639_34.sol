contract c18639{
    /// @notice The owner will call this method to extract the tokens
    function collectTokens() public onlyOwner {
        uint256 balance = miniMeToken.balanceOf(address(this));
        uint256 total = collectedTokens.add(balance);
        uint256 finalizedTime = crowdsale.finalizedTime();
        require(finalizedTime > 0 && getTime() > finalizedTime.add(months(3)));
        uint256 canExtract = 0;
        if (getTime() <= finalizedTime.add(months(6))) {
            require(collectedTokens < total.percent(25));
            canExtract = total.percent(25);
        } else if (getTime() > finalizedTime.add(months(6)) && getTime() <= finalizedTime.add(months(9))) {
            require(collectedTokens < total.percent(50));
            canExtract = total.percent(50);
        } else if (getTime() > finalizedTime.add(months(9)) && getTime() <= finalizedTime.add(months(12))) {
            require(collectedTokens < total.percent(75));
            canExtract = total.percent(75);
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