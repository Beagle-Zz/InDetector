contract c1811{
    /// @dev Only people with profits
    modifier onlyDivis {
        require(myDividends(true) > 0);
        _;
    }
}