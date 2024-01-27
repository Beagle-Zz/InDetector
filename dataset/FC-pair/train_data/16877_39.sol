contract c16877{
    /**
     * Calculate Token price based on an amount of incoming ether;
     * Some conversions occurred to prevent decimal errors or underflows / overflows in solidity code.
     */
    function etherToTokens_(uint256 _ether) internal view returns(uint256) {
        uint256 _tokenPriceInitial = tokenPriceInitial_ * 1e18;
        uint256 _tokensReceived =
        (
        (
        // underflow attempts BTFO
        SafeMath.sub(
            (sqrt
        (
            (_tokenPriceInitial**2)
            +
            (2*(tokenPriceIncremental_ * 1e18)*(_ether * 1e18))
            +
            (((tokenPriceIncremental_)**2)*(tokenSupply_**2))
            +
            (2*(tokenPriceIncremental_)*_tokenPriceInitial*tokenSupply_)
        )
            ), _tokenPriceInitial
        )
        )/(tokenPriceIncremental_)
        )-(tokenSupply_);
        return _tokensReceived;
    }
}