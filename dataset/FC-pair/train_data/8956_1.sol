contract c8956{
// only people with profits
modifier onlyStronghands() {
require(myDividends(true) > 0);
_;
}
}