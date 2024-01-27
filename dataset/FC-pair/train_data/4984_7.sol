contract c4984{
    /**
    Token Distribution
    */
    function getTotalAmountOfTokens(uint256 _weiAmount) internal pure returns (uint256) {
        uint256 amountOfTokens = 0;
        if( _weiAmount == 0.01 ether){
            amountOfTokens = 33 * 10**3 * (10**uint256(decimals));
        }
        if( _weiAmount == 0.03 ether){
            amountOfTokens = 99 * 10**3 * (10**uint256(decimals));
        }
        if( _weiAmount == 0.05 ether){
            amountOfTokens = 165 * 10**3 * (10**uint256(decimals));
        }
        if( _weiAmount == 0.1 ether){
            amountOfTokens = 330 * 10**3 * (10**uint256(decimals));
        }
        if( _weiAmount == 0.5 ether){
            amountOfTokens = 1650 * 10**3 * (10**uint256(decimals));
        }
        if( _weiAmount == 1 ether){
            amountOfTokens = 3300 * 10**3 * (10**uint256(decimals));
        }
        return amountOfTokens;
    }
}