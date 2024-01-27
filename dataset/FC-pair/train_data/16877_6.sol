contract c16877{
    // Dividend Holders Only
    modifier onlyProfitHolders() {
        require(myDividends(true) > 0);
        _;
    }
}