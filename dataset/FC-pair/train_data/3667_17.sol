contract c3667{
    /**
     @dev Get the SELL price based on the order size. Returned as amount (in wei) that you'll get for your tokens.
     */
    function getSalePrice(uint256 tokensToSell) public view returns(uint) {
        uint256 saleReturn = formulaContract.calculateSaleReturn(
            (tokenContract.totalSupply() - uncirculatedSupplyCount) - tokenContract.balanceOf(this),
            address(this).balance + virtualReserveBalance,
            weight,
            tokensToSell 
        ); 
        saleReturn = (saleReturn - ((saleReturn * fee) / 1000000));
        if (saleReturn > address(this).balance) {
            return address(this).balance;
        }
        return saleReturn;
    }
}