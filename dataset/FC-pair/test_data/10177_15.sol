contract c10177{
    /// @dev Access modifier for COO-only functionality
    modifier onlyCOO() {
        require(msg.sender == coo);
        _;
    }
}