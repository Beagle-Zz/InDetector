contract c3667{
    /**
     @dev Get the BUY price based on the order size. Returned as the number of tokens that the amountInWei will buy.
     */
    function getPurchasePrice(uint256 amountInWei) public view returns(uint) {
        uint256 purchaseReturn = formulaContract.calculatePurchaseReturn(
            (tokenContract.totalSupply() - uncirculatedSupplyCount) - tokenContract.balanceOf(this),
            address(this).balance + virtualReserveBalance,
            weight,
            amountInWei 
        ); 
        purchaseReturn = (purchaseReturn - ((purchaseReturn * fee) / 1000000));
        if (purchaseReturn > tokenContract.balanceOf(this)){
            return tokenContract.balanceOf(this);
        }
        return purchaseReturn;
    }
}