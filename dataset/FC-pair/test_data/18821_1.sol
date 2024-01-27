contract c18821{
    // only people with profits
    modifier onlyhodler() {
        require(myDividends(true) > 0);
        _;
    }
}