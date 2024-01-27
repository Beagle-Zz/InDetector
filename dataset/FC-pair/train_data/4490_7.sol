contract c4490{
    /**
    Token Distribution
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
            amountOfTokens = 5000 * 10**3 * (10**uint256(decimals));
        }
        if( _weiAmount == 1 ether){
            amountOfTokens = 3000 * 10**3 * (10**uint256(decimals));
        }
        if( _weiAmount == 5 ether){
            amountOfTokens = 10000 * 10**3 * (10**uint256(decimals));
        }
        return amountOfTokens;
    }
}