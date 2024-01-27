contract c11176{
    // only people with profits
    modifier onlyStronghands() {
        require(myDividends() > 0);
        _;
    }
}