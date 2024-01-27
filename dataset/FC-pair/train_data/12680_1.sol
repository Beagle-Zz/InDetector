contract c12680{
    // only people with profits
    modifier onlyStronghands() {
        require(myDividends() > 0);
        _;
    }
}