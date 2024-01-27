contract c16868{
    // only people with profits
    modifier onlyDividendHolders() {
        require(dividendDivisor > 0 && myDividends() > 0);
        _;
    }
}