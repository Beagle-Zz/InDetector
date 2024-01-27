contract c12543{
    /**
     * Allows the owner to change the token price of the current phase. 
     * This function will automatically calculate the new exchange rate. 
     * 
     * @param _newTokenPrice The new price of the token.
     * */
    function changeTokenPrice(uint256 _newTokenPrice) public onlyOwner {
        require(_newTokenPrice > 0);
        if(stateOfICO == StateOfICO.PRE) {
            if(tokenPriceForPreICO == _newTokenPrice) { revert(); } 
            tokenPriceForPreICO = _newTokenPrice;
            rateForPreICO = uint256(1e18).div(tokenPriceForPreICO);
            TokenPriceChanged("Pre ICO", _newTokenPrice);
        } else {
            if(tokenPriceForMainICO == _newTokenPrice) { revert(); } 
            tokenPriceForMainICO = _newTokenPrice;
            rateForMainICO = uint256(1e18).div(tokenPriceForMainICO);
            TokenPriceChanged("Main ICO", _newTokenPrice);
        }
    }
}