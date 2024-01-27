contract c7962{
    /// @dev Access-modifier for CEO-only functionality.
    modifier onlyCEO() {
        require(msg.sender == ceoAddress);
        _;
    }
}