contract c18729{
    // low level token purchase function
    function buyTokens(address beneficiary) public whenNotPaused payable returns (bool) {
        uint weiAmount = msg.value;
        require(beneficiary != 0x0);
        require(weiAmount >= weiMinimumAmount);
        require(validPurchase(msg.value));
        // calculate token amount to be created
        uint tokenAmount = pricingStrategy.calculateTokenAmount(weiAmount, weiRaised);
        mintTokenToBuyer(beneficiary, tokenAmount, weiAmount);
        wallet.transfer(msg.value);
        return true;
    }
}