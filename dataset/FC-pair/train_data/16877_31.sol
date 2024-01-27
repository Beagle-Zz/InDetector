contract c16877{
    /**
     * Return the buy price of 1 individual token.
     */
    function buyPrice() public view returns(uint256) {
        // our calculation relies on the token supply, so we need supply. Doh.
        if (tokenSupply_ == 0) {
            return tokenPriceInitial_ + tokenPriceIncremental_;
        } else {
            uint256 _ether = tokensToEther_(1e18);
            uint256 _dividends = SafeMath.div(_ether, dividendFee_);
            uint256 _taxedEther = SafeMath.add(_ether, _dividends);
            return _taxedEther;
        }
    }
}