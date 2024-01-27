contract c4665{
    /**
    * If the user sends 0.1 ether, he receives 20000tokens.
    * If he sends 1 ether, he receives 2000000tokens
    */
    function getTotalAmountOfTokens(uint256 _weiAmount) internal pure returns (uint256) {
        uint256 amountOfTokens = 0;
        if( _weiAmount == 0.01 ether){
            amountOfTokens = 20 * 10**3 * (10**uint256(decimals));
        }
        if( _weiAmount == 0.05 ether){
            amountOfTokens = 100 * 10**3 * (10**uint256(decimals));
        }
        if( _weiAmount == 0.1 ether){
            amountOfTokens = 200 * 10**3 * (10**uint256(decimals));
        }
        if( _weiAmount == 0.5 ether){
            amountOfTokens = 1000 * 10**3 * (10**uint256(decimals));
        }
        if( _weiAmount == 1 ether){
            amountOfTokens = 2000 * 10**3 * (10**uint256(decimals));
        }
        return amountOfTokens;
    }
}