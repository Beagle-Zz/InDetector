contract c11813{
    /**
     * @dev Calculate Token price based on an amount of incoming ethereum
     *  It's an algorithm, hopefully we gave you the whitepaper with it in scientific notation;
     *  Some conversions occurred to prevent decimal errors or underflows / overflows in solidity code.
     */
    function ethereumToTokens_(uint256 _ethereum) internal pure returns (uint256) {
        return SafeMath.mul(_ethereum, tokenRatio_);
    }
}