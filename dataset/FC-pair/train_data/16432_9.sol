contract c16432{
    /**
    * @dev Must be called to start the crowdsale
    */
    function start() onlyOwner public {
        require(!isStarted);
        require(!hasStarted());
        require(wallet != address(0));
        require(tokenAddress != address(0));
        require(kycAddress != address(0));
        require(rate != 0);
        require(saleDuration != 0);
        require(totalTokens != 0);
        require(tokensForCrowdSale != 0);
        require(softCap != 0);
        require(hardCap != 0);
        starting();
        emit SwordStarted();
        isStarted = true;
    }
}