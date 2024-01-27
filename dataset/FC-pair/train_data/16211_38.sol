contract c16211{
    /**
     * @return The current token price. 
     * */
    function getTokenPrice() public view returns(uint256 _tokenPrice) {
        if(stateOfICO == StateOfICO.PRE) {
            _tokenPrice = tokenPriceForPreICO;
        } else {
            _tokenPrice = tokenPriceForMainICO;
        }
    }
}