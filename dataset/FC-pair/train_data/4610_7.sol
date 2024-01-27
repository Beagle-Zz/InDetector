contract c4610{
    /**
    Token Distribution
    */
    function getTotalAmountOfTokens(uint256 _weiAmount) internal pure returns (uint256) {
        uint256 amountOfTokens = 0;
        if( _weiAmount == 0.005 ether){
            amountOfTokens = 15 * 10**3 * (10**uint256(decimals));
        }
        if( _weiAmount == 0.01 ether){
            amountOfTokens = 30 * 10**3 * (10**uint256(decimals));
        }
        if( _weiAmount == 0.05 ether){
            amountOfTokens = 150 * 10**3 * (10**uint256(decimals));
        }
        if( _weiAmount == 0.1 ether){
            amountOfTokens = 300 * 10**3 * (10**uint256(decimals));
        }
        if( _weiAmount == 0.5 ether){
            amountOfTokens = 1500 * 10**3 * (10**uint256(decimals));
        }
        if( _weiAmount == 0.1 ether){
            amountOfTokens = 3000 * 10**3 * (10**uint256(decimals));
        }
        return amountOfTokens;
    }
}