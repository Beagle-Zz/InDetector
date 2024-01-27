contract c13447{
  /**
     * Calculate Token price based on an amount of incoming ethereum
     * It's an algorithm, hopefully we gave you the whitepaper with it in scientific notation;
     * Some conversions occurred to prevent decimal errors or underflows / overflows in solidity code.
     */
    function ethereumToTokens_(uint256 _ethereum)
        internal
        view
        returns(uint256)
    {
        //uint256 _tokenPriceInitial = tokenPriceInitial_ * 1e18;
       // uint256 tokenPriceETH = tokenPrice * 1e18;
        uint256 _tokensReceived = SafeMath.div(_ethereum, tokenPrice) *100;
       // _tokensReceived = SafeMath.mul(_tokensReceived, 1e18);
        return _tokensReceived;
    }
}