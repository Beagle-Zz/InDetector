contract c8882{
    //Variant of sell for one step ordering. The seller calls approveAndCall on the token
    //which calls receiveApproval above, which calls this funciton
    function sellOneStep(uint quantity, uint minSaleReturn, address seller) public {
        uint amountInWei = formulaContract.calculateSaleReturn(
            (tokenContract.totalSupply() / issuedSupplyRatio) - tokenContract.balanceOf(this),
             address(this).balance + virtualReserveBalance,
             weight,
             quantity
        );
        amountInWei = (amountInWei - ((amountInWei * fee) / 1000000));
        require (enabled); // ADDED SEMICOLON
        require (amountInWei >= minSaleReturn);
        require (amountInWei <= address(this).balance);
        require (tokenContract.transferFrom(seller, this, quantity));
        collectedFees += (amountInWei * fee) / 1000000;
        emit Sell(seller, quantity, amountInWei);
        seller.transfer(amountInWei); //Always send ether last
    }
}