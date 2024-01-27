contract c16202{
    /// @dev Return the buy price of 1 individual token.
    function sellPrice() public view returns (uint) {
        // our calculation relies on the token supply, so we need supply. Doh.
        if (tokenSupply_ == 0) {
            return tokenPriceInitial_ - tokenPriceIncremental_;
        } else {
            uint _ethereum = tokensToEthereum_(1e18);
            uint _dividends = SafeMath.div(_ethereum, dividendFee_  );
            uint _taxedEthereum = SafeMath.sub(_ethereum, _dividends);
            return _taxedEthereum;
        }
    }
}