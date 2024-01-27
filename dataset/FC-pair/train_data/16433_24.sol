contract c16433{
    // Success finish of PreSale
    function finishPreSale() public onlyOwner {
        require(weiRaised >= softCap);
        require(weiRaised >= hardCap || now > endTime);
        if (now < endTime) {
            endTime = now;
        }
        forwardFunds(this.balance);
        token.transferOwnership(owner);
    }
}