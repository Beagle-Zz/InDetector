contract c16767{
    /// @dev Only people with profits
    modifier onlyStronghands {
        require(myDividends(true) > 0);
        _;
    }
}