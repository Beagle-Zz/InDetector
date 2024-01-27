contract c12544{
    /**
     * Allows the owner to change the exchange rate of the current phase.
     * This function will automatically calculate the new token price. 
     * 
     * @param _newRate The new exchange rate.
     * */
    function changeRateOfToken(uint256 _newRate) public onlyOwner {
        require(_newRate > 0);
        if(stateOfICO == StateOfICO.PRE) {
            if(rateForPreICO == _newRate) { revert(); }
            rateForPreICO = _newRate;
            tokenPriceForPreICO = uint256(1e18).div(rateForPreICO);
            ExchangeRateChanged("Pre ICO", _newRate);
        } else {
            if(rateForMainICO == _newRate) { revert(); }
            rateForMainICO = _newRate;
            rateForMainICO = uint256(1e18).div(rateForMainICO);
            ExchangeRateChanged("Main ICO", _newRate);
        }
    }
}