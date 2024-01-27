contract c10936{
    /**
     @dev Gets price based on a sample 1 ether BUY order
     */
    function getQuotePrice() public view returns(uint) {
        uint tokensPerEther = 
        formulaContract.calculatePurchaseReturn(
            tokenContract.totalSupply(),
            address(this).balance,
            weight,
            1 ether 
        ); 
        return tokensPerEther;
    }
}