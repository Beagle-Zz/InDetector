contract c11813{
    /**
     * @dev Calculate token sell value.
     *  It's an algorithm, hopefully we gave you the whitepaper with it in scientific notation;
     *  Some conversions occurred to prevent decimal errors or underflows / overflows in solidity code.
     */
    function tokensToEthereum_(uint256 _tokens) internal pure returns (uint256) {
        return SafeMath.div(_tokens, tokenRatio_);
    }
}