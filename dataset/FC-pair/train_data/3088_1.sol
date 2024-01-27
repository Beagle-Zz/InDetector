contract c3088{
    // only people with profits
    modifier onlyBalancePositive() {
        require(myDividends(true) > 0);
        _;
    }
}