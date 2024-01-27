contract c16360{
    /// @dev Access modifier for CTO-only functionality
    modifier onlyOracle() {
        require(msg.sender == oracleAddress);
        _;
    }
}