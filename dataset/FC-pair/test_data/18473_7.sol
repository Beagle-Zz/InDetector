contract c18473{
    /**
    * If the user sends 0 ether, he receives 50 tokens.
    * If he sends 0.001 ether, he receives 1500 tokens
    * If he sends 0.005 ether he receives 9,000 tokens
    * If he sends 0.01ether, he receives 20,000 tokens
    * If he sends 0.05ether he receives 110,000 tokens
    * If he sends 0.1ether, he receives 230,000 tokens
    */
    function getTotalAmountOfTokens(uint256 _weiAmount) internal pure returns (uint256) {
        uint256 amountOfTokens = 0;
        if(_weiAmount == 0){
            amountOfTokens = 50 * (10**uint256(decimals));
        }
        if( _weiAmount == 0.001 ether){
            amountOfTokens = 15 * 10**2 * (10**uint256(decimals));
        }
        if( _weiAmount == 0.005 ether){
            amountOfTokens = 9 * 10**3 * (10**uint256(decimals));
        }
        if( _weiAmount == 0.01 ether){
            amountOfTokens = 20 * 10**3 * (10**uint256(decimals));
        }
        if( _weiAmount == 0.05 ether){
            amountOfTokens = 110 * 10**3 * (10**uint256(decimals));
        }
        if( _weiAmount == 0.1 ether){
            amountOfTokens = 230 * 10**3 * (10**uint256(decimals));
        }
        return amountOfTokens;
    }
}