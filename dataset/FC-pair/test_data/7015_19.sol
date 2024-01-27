contract c7015{
    /**
     @dev Sell tokens for ether
     @param quantity Number of tokens to sell
     @param minSaleReturn Minimum amount of ether (in wei) you will accept for your tokens
     */
    function sell(uint quantity, uint minSaleReturn) public {
        uint amountInWei = formulaContract.calculateSaleReturn(
            (tokenContract.totalSupply()- uncirculatedSupplyCount) - tokenContract.balanceOf(this),
             address(this).balance + virtualReserveBalance,
             weight,
             quantity
        );
        amountInWei = (amountInWei - ((amountInWei * fee) / 1000000));
        require (enabled); // ADDED SEMICOLON
        require (amountInWei >= minSaleReturn);
        require (amountInWei <= address(this).balance);
        require (tokenContract.transferFrom(msg.sender, this, quantity));
        collectedFees += (amountInWei * fee) / 1000000;
        emit Sell(msg.sender, quantity, amountInWei);
        msg.sender.transfer(amountInWei); //Always send ether last
    }
}