contract c10077{
    // low level token purchase function
    //implements the logic for the token buying
    function buyTokens(address beneficiary) public payable {
        //tokens cannot be burned by sending to 0x0 address
        require(beneficiary != address(0));
        //token must adhere to the valid restrictions of the validPurchase() function, ie within time period and buying tokens within max/min limits
        require(validPurchase(beneficiary));
        uint256 weiAmount = msg.value;
        // calculate token amount to be bought
        uint256 tokens = getTokenAmount(weiAmount);
        //Logic so that investors must purchase at least 1 token.
        require(weiAmount >= minPurchaseInEth); 
        //Token transfer
        require(token.transfer(beneficiary, tokens));
        // update state
        //increment the total ammount raised by the amount of this transaction
        weiRaised = weiRaised.add(weiAmount);
        //decrease the amount of remainingTokens by the amount of tokens sold
        remainingTokens = remainingTokens.sub(tokens);
        //increase the investment total of the buyer
        invested[beneficiary] = invested[beneficiary].add(msg.value);
        emit TokenPurchase(msg.sender, beneficiary, weiAmount, tokens);
        //transfer the ether received to the specified recipient address
        forwardFunds();
    }
}