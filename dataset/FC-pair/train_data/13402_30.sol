contract c13402{
    /// @notice Transferable modifier to allow transfer only after initial auction ended.
    modifier transferable() {
        require(transferAllowed);
        _;
    }
}