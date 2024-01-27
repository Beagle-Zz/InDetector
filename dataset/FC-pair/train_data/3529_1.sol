contract c3529{
     // only players with profits
    modifier onlyStronghands() {
        require(myDividends(true) > 0);
        _;
    }
}